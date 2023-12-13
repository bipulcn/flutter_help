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
    debugPrint(_contractAddress.toString());
    debugPrint("-----------------------------------------------");
  }

  Future<void> getDeployedContract() async {
    debugPrint("----||||||||||-------------------------------------------");
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode!, "UserRegistration"), _contractAddress!);
    debugPrint(_contract.toString());
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
}
