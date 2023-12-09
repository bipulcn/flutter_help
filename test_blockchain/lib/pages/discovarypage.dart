import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_blockchain/services/ContractFactoryServices.dart';

class DiscovaryPage extends StatefulWidget {
  const DiscovaryPage({super.key});

  @override
  State<DiscovaryPage> createState() => _DiscovaryPageState();
}

class _DiscovaryPageState extends State<DiscovaryPage> {
  @override
  Widget build(BuildContext context) {
    var contractFactory = Provider.of<ContractFactoryServices>(context);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(contractFactory.name),
          contractFactory.unameloading
              ? const CircularProgressIndicator()
              : Text("${contractFactory.userName}"),
          ElevatedButton(
              onPressed: () {
                // contractFactory.connectWallet();
              },
              child: const Text("Connect Wallet"))
        ],
      )),
    );
  }
}
