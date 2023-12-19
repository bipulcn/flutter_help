import 'dart:convert';
import 'dart:ffi';
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mnemonic = prefs.get("mnemonic").toString();
    String privateKey = bip39.mnemonicToSeedHex(mnemonic);
    prefs.setString("privateKey", privateKey);
    debugPrint(privateKey);
    var ekey = EthPrivateKey.fromHex(privateKey);
    debugPrint(ekey.address.toString());

    notifyListeners();
  }

  Future<double> getBalace() async {
    var cred = EthPrivateKey.fromHex(
        "0b00d7489d13534a5adc4e83b85a23a7fdb0a4dbc1feaea66ca19e717bd26aaa");
    var keys =
        EthereumAddress.fromHex("0x6ff37f60651a216f6E5EEb29425744a963B17248");
    debugPrint("From pri: ${cred.address}");
    debugPrint("From pub: ${keys}");
    EtherAmount eamount = await _client!.getBalance(cred.address);
    return eamount.getValueInUnit(EtherUnit.ether);
  }

  Future<void> sendMoney() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String men = prefs.get("mnemonic").toString();
    String hex = bip39.mnemonicToSeedHex(men);
    _privateKey = EthPrivateKey.fromHex(hex);
    // _privateKey = EthPrivateKey.fromHex(prefs.get("privteAdd").toString())
    // as EthPrivateKey;
/*
    await _client!.sendTransaction(
      cred,
      Transaction(
        to: _contractAddress,
        gasPrice: EtherAmount.inWei(BigInt.one),
        maxGas: 100000,
        value: EtherAmount.fromBigInt(EtherUnit.ether, BigInt.from(1)),
      ),
    );
    */

    var cred = EthPrivateKey.fromHex(
        "0b00d7489d13534a5adc4e83b85a23a7fdb0a4dbc1feaea66ca19e717bd26aaa");
    await _client!.sendTransaction(
      cred,
      Transaction(
        from: EthereumAddress.fromHex(
            "0xb572d75e42439ed293FC9b7db69C92a3d976D219"),
        to: EthereumAddress.fromHex(
            "0xda5D2181CA7CDFa6B1b0a874399F179Ce10d239e"),
        gasPrice: EtherAmount.inWei(BigInt.zero),
        maxGas: 100000,
        value: EtherAmount.fromBigInt(
            EtherUnit.gwei, BigInt.from(1)), //(BigInt.one),
      ),
    );
    notifyListeners();
    return Future.value();
  }

  Future<void> saveUser(String name, int age) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var passwd = "esrd@labApp";
    var jsWal = prefs.get("wallet").toString();
    Wallet wallet;
    debugPrint(jsWal);
    if (jsWal != "") {
      wallet = Wallet.fromJson(jsWal, passwd);
    } else {
      var mnemonic = bip39.generateMnemonic();
      String hex = bip39.mnemonicToSeedHex(mnemonic);
      EthPrivateKey priKey = EthPrivateKey.fromHex(hex);
      wallet = Wallet.createNew(priKey, passwd, Random.secure());
      prefs.setString("publicKey", wallet.privateKey.address.toString());
      prefs.setString("wallet", wallet.toJson());
    }
    var creds = wallet.privateKey;
    String res = await _client!.sendTransaction(
        EthPrivateKey.fromHex(creds.address.toString()),
        Transaction.callContract(
          contract: _contract!,
          function: _contract!.function("addUser"),
          parameters: [name, BigInt.from(age)],
        ),
        fetchChainIdFromNetworkId: true,
        chainId: null);

    notifyListeners();
    return Future.value();
  }

  String getMnemanic() {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mnemonic = prefs.getString("mnemonic").toString();
    if(mnemonic =="")
    mnemonic = bip39.generateMnemonic();
    return bip39.generateMnemonic();
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var mnemonic = prefs.get("mnemonic").toString();
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
    // if (prefs.getString("wallet") == null) {
    // if (prefs.getString("mnemonic") == null) {
    mnemonic = bip39.generateMnemonic();
    // await prefs.setString("mnemonic", mnemonic);
    // } else {
    //   mnemonic = prefs.getString("mnemonic")!;
    // }
    // print(mnemonic);
    String hexSeed = bip39.mnemonicToSeedHex(mnemonic);
    debugPrint(hexSeed);
    debugPrint(mnemonic);
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
    _privateKey = EthPrivateKey.fromHex(hexSeed);
    // await prefs.setString("privteAdd", _privateKey.toString());
    debugPrint("Private Address is ${_privateKey!.address.toString()}");
    Wallet wallet = Wallet.createNew(_privateKey!, passwd, Random.secure());
    debugPrint(
        "wallet encoded address is ${wallet.privateKey.encodedPublicKey.toString()}");
    debugPrint(
        "wallet address hash is ${wallet.privateKey.hashCode.toString()}");
    debugPrint(
        "wallet address public is ${wallet.privateKey.publicKey.toString()}");
    debugPrint("wallet address is ${wallet.privateKey.address.toString()}");
    debugPrint("Public address ${wallet.privateKey.address.hex.toString()}");
    // await prefs.setString("wallet", wallet.privateKey.address.hex);
    // } else {
    //   String wallet = prefs.getString("wallet")!;
    //   print(wallet);
    // }
  }
}
