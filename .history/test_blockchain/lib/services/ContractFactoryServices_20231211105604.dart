import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:test_blockchain/units/Constants.dart';
// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractFactoryServices extends ChangeNotifier {
  Constants constants = Constants();

  //  ====== Constants Blocchain Data ======
  String name = "Provide Test Data";

  // 1- Connect to blockchain Network
  Web3Client? _cleint;
  String? _abiCode;
  EthereumAddress? _contractAddress;
  DeployedContract? _contract;
  List<dynamic> userName = [];
  List<dynamic> oneName = [];
  bool unameloading = true;

  ContractFactoryServices() {
    _setUpNetwork();
  }

  // final connector = WalletConnect(
  //   bridge: 'https://bridge.walletconnect.org',
  //   clientMeta: const PeerMeta(
  //     name: 'User Registration',
  //     url: 'https://walletconnect.org',
  //     description: 'WalletConnect.org',
  //     icons: [
  //       'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
  //     ],
  //   ),
  // );

  // connectWallet() async {
  //   if (!connector.connected) {
  //     await connector.createSession(
  //       onDisplayUri: (_uri) async {
  //         await launchUrlString(_uri, mode: LaunchMode.externalApplication);
  //       },
  //     );
  //     try {} catch (e) {
  //       debugPrint(e.toString());
  //     }
  //   }
  // }

  _setUpNetwork() async {
    _cleint = Web3Client(
      constants.NETWORK_HTTPS_RPC,
      Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(constants.NETWORK_WSS_RPC)
            .cast<String>();
      },
    );
    await fetchABIAndContractAddress();
    await getDeployedContract();
  }

  // 2- Connect with Smart Contract
  // a-get abi and contract address
  Future<void> fetchABIAndContractAddress() async {
    String abiFileRoot =
        await rootBundle.loadString(constants.CONTRACT_ABI_PATH);
    // debugPrint(abiFileRoot);
    var abiJson = jsonDecode(abiFileRoot);
    _abiCode = jsonEncode(abiJson["abi"]);
    // debugPrint(_abiCode);
    // Get Address
    _contractAddress = EthereumAddress.fromHex(constants.CONTRACT_ADDRESS);
    debugPrint(_contractAddress.toString());
  }

  // b-take this abi and address to get the deployed contract
  Future<void> getDeployedContract() async {
    // Deployed Contract
    var tmp = ContractAbi.fromJson(_abiCode!, "UserRegistration");
    debugPrint(tmp.toString());
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode!, "UserRegistration"), _contractAddress!);
    debugPrint(_contract.toString());
    await _getUserName();
  }

  // 3- Fetch All Functions and data
  // GET STORE NAME FROM BLOCKChAIN
  _getUserName() async {
    var data = await _cleint!.call(
        contract: _contract!,
        function: _contract!.function("userid"),
        params: []);
    debugPrint(data.toString());
    userName = await _cleint!.call(
        contract: _contract!,
        function: _contract!.function("viewUser"),
        params: [BigInt.from(0)]);
    if (userName[0].length > 0) {
      List<dynamic> oneName = userName[0];
      debugPrint(oneName.toString());
      unameloading = false;
    } else {
      unameloading = true;
    }
    notifyListeners();
  }
}
