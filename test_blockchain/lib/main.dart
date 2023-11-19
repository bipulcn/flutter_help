import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_blockchain/pages/discovarypage.dart';
import 'package:test_blockchain/services/ContractFactoryServices.dart';

void main() {
  runApp(const MyApp());
}

// 0x54cd5FBdEBD6BFBd181dB86B2a17c50E4d49fBF2

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContractFactoryServices(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DiscovaryPage(),
      ),
    );
  }
}
