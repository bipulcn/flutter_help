import 'dart:convert';
import 'dart:math';

import 'package:chainids/units/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:bip39/bip39.dart' as bip39;

class BlockData extends ChangeNotifier {
  Constants constants = Constants();
  Web3Client? _client;
  String? _abiCode;
  EthereumAddress? _contractAddress;
  DeployedContract? _contract;
  EthPrivateKey? _privateKey;

  BlockData() {
    _setUpNetwork();
  }
  _setUpNetwork() async {
    _client = Web3Client(
      constants.NETWORK_HTTPS_RPC,
      Client(),
      socketConnector: () =>
          IOWebSocketChannel.connect(constants.NETWORK_WSS_RPC).cast<String>(),
    );
    await getAbi();
  }

  Future<void> getAbi() async {
    String abiFile = await rootBundle.loadString(constants.CONTRACT_ABI_PATH);
    var abiJson = jsonDecode(abiFile);
    _abiCode = jsonEncode(abiJson["abi"]);
    _contractAddress = EthereumAddress.fromHex(constants.CONTRACT_ADDRESS);
    // Take this abi and address to get the deployed contract
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode!, "UserRegistration"), _contractAddress!);
  }

  Future<List<dynamic>> readData(
      String functionName, List<dynamic> args) async {
    final ethFunction = _contract!.function(functionName);
    final result = await _client!.call(
      contract: _contract!,
      function: ethFunction,
      params: args,
    );
    return result;
  }

  Future<void> getUserName() async {
    var data = await _client!.call(
        contract: _contract!,
        function: _contract!.function("userid"),
        params: []);
    debugPrint(data.toString());
    int ls = int.parse(data[0].toString());
    ls--;
    debugPrint(ls.toString());
    List<dynamic> userName = await _client!.call(
        contract: _contract!,
        function: _contract!.function("viewUser"),
        params: [BigInt.from(ls)]);
    if (userName[0].length > 0) {
      List<dynamic> oneName = userName[0];
      debugPrint(oneName.toString());
    } else {
      // unameloading = true;
    }
    notifyListeners();
  }

  Future<double> getBalace() async {
    EtherAmount eamount = await _client!.getBalance(_contractAddress!);
    return eamount.getValueInUnit(EtherUnit.ether);
  }

  Future<void> sendMoney() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String men = prefs.get("mnemonic").toString();
    String hex = bip39.mnemonicToSeedHex(men);
    _privateKey = EthPrivateKey.fromHex(hex);
    // _privateKey = EthPrivateKey.fromHex(prefs.get("privteAdd").toString())
    // as EthPrivateKey;
    await _client!.sendTransaction(
      _privateKey!,
      Transaction(
        from:
            EthPrivateKey.fromHex("0xb572d75e42439ed293FC9b7db69C92a3d976D219")
                .address,
        to: _contractAddress,
        value: EtherAmount.fromInt(EtherUnit.ether, 1),
      ),
    );
    notifyListeners();
    return Future.value();
  }

  Future<void> saveUser(String name, int age) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String pky = prefs.get("privteAdd").toString();
    debugPrint("thie private key $pky");
    String men = prefs.get("mnemonic").toString();
    String hex = bip39.mnemonicToSeedHex(men);
    _privateKey = EthPrivateKey.fromHex(hex);
    debugPrint(_contract.toString());
    debugPrint(_privateKey.toString());
    String res = await _client!.sendTransaction(
      EthPrivateKey.fromHex("0xb572d75e42439ed293FC9b7db69C92a3d976D219"),
      Transaction.callContract(
        contract: _contract!,
        function: _contract!.function("addUser"),
        parameters: [name, BigInt.from(age)],
      ),
    );
    debugPrint("saved $res");
    // await _client!.call(
    //   contract: _contract!,
    //   function: _contract!.function("addUser"),
    //   params: [name, BigInt.from(28)],
    // );

    notifyListeners();
    return Future.value();
  }

  Future<String> getPublicAddress() async {
    final String privateKey = await getPrivateKey();
    debugPrint("New Private Key is $privateKey");
    final EthPrivateKey ethPrivateKey = EthPrivateKey.fromHex(privateKey);
    debugPrint("Address is ${ethPrivateKey.address.toString()}");
    final EthereumAddress ethereumAddress = ethPrivateKey.address;
    debugPrint(ethereumAddress.toString());
    return ethereumAddress.hex;
  }

  Future<String> getPrivateKey() async {
    var mnemonic = bip39.generateMnemonic();
    debugPrint(mnemonic);
    String fromHex = bip39.mnemonicToSeedHex(mnemonic);
    _privateKey = EthPrivateKey.fromHex(fromHex);
    debugPrint(_privateKey!.address.toString());
    return _privateKey!.address.hex;
  }

  // /// Returns BIP32 Extended Public Key
  // Future<String> getPublicKey() async {
  //   final String mnemonic = await _mnemonicProvider.getMnemonic();
  //   final Chain chain = _getChainByMnemonic(mnemonic);
  //   final ExtendedKey extendedKey = chain.forPath(_pathForPublicKey);
  //   return extendedKey.publicKey().toString();
  // }

  void createWallet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var mnemonic;
    if (prefs.getString("wallet") == null) {
      if (prefs.getString("mnemonic") == null) {
        mnemonic = bip39.generateMnemonic();
        await prefs.setString("mnemonic", mnemonic);
      } else {
        mnemonic = prefs.getString("mnemonic")!;
      }
      // print(mnemonic);
      String fromHex = bip39.mnemonicToSeedHex(mnemonic);
      // print(seed);
      // print(mnemonic);
      // bool isValid = bip39.validateMnemonic(mnemonic);
      // print(isValid);

      // showDialog(
      //     context: context,
      //     builder: (context) {
      //       return AlertDialog(
      //         content: Text(mnemonic),
      //       );
      //     });
      var passwd = "super3cr";
      _privateKey = EthPrivateKey.fromHex(fromHex);
      await prefs.setString("privteAdd", _privateKey.toString());
      print(_privateKey!.address);
      Wallet wallet = Wallet.createNew(_privateKey!, passwd, Random.secure());
      print(wallet.privateKey);
      await prefs.setString("wallet", wallet.privateKey.address.hex);
    } else {
      String wallet = prefs.getString("wallet")!;
      print(wallet);
    }
  }
}
