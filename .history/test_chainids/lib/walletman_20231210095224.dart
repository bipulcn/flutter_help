import 'dart:math';

import 'package:flutter/material.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';

class WalletMan extends StatefulWidget {
  const WalletMan({super.key});

  @override
  State<WalletMan> createState() => _WalletManState();
}

class _WalletManState extends State<WalletMan> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("WalletMan"),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
            onPressed: createWallet,
            child: const Text(
              "Press",
              style: TextStyle(color: Colors.white),
            ),
          ),
          createForm(context),
        ],
      ),
    );
  }

  Widget createForm(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white),
                icon: const Icon(Icons.save))
          ],
        ),
      ),
    );
  }

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
      EthPrivateKey privateKey = EthPrivateKey.fromHex(fromHex);
      print(privateKey.address);
      Wallet wallet = Wallet.createNew(privateKey, passwd, Random.secure());
      print(wallet.privateKey);
      await prefs.setString("wallet", wallet.privateKey.address.hex);
    } else {
      String wallet = prefs.getString("wallet")!;
      print(wallet);
    }
  }
}
