import 'dart:convert';

import 'package:chainids/units/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class BlockData extends ChangeNotifier {
  Constants constants = Constants();
  Web3Client? _client;
  String? _abiCode;
  EthereumAddress? _contractAddress;
  DeployedContract? _contract;
  bool unameloading = true;

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
    await getDeployedContract();
  }

  Future<void> getAbi() async {
    String abiFile = await rootBundle.loadString(constants.CONTRACT_ABI_PATH);
    var abiJson = jsonDecode(abiFile);
    _abiCode = jsonEncode(abiJson);
    _contractAddress = EthereumAddress.fromHex(constants.CONTRACT_ADDRESS);
  }

  Future<void> getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode!, "UserRegistration"), _contractAddress!);
  }
}
