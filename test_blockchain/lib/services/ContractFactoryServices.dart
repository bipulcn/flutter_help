import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:test_blockchain/units/Constants.dart';
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
  String oneName = '';
  bool unameloading = true;

  ContractFactoryServices() {
    _setUpNetwork();
  }
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
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode!, "UserRegistration"), _contractAddress!);
    debugPrint(_contract.toString());
    await _getUserName();
  }

  // 3- Fetch All Functions and data
  // GET STORE NAME FROM BLOCKChAIN
  _getUserName() async {
    userName = await _cleint!.call(
        contract: _contract!,
        function: _contract!.function("retrieve"),
        params: []);
    if (userName[0].length > 0) {
      oneName = userName[0];
      unameloading = false;
    } else {
      unameloading = true;
    }
    notifyListeners();
  }
}
