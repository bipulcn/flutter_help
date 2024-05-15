import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_blocs/provide/cusprovider.dart';
import 'package:test_blocs/provide/provsubpage.dart';

class ProviderHome extends StatefulWidget {
  const ProviderHome({super.key});

  @override
  State<ProviderHome> createState() => _ProviderHomeState();
}

class _ProviderHomeState extends State<ProviderHome> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => CusProvider(),
      )
    ], child: ProviderResult());
  }
}

class ProviderResult extends StatelessWidget {
  const ProviderResult({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.text_snippet)),
          ]),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Provider Page Bello is the provider value "),
                Text("${context.watch<CusProvider>().name.toString()}"),
                ElevatedButton(
                    onPressed: () {
                      context.read<CusProvider>().changeName(genRandomText());
                    },
                    child: Text("Change")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, "/home");
                    },
                    child: Text("Please Click"))
              ],
            ),
            ProvSubpage(),
          ],
        ),
      ),
    );
  }

  String genRandomText() {
    List<String> str = ['test', 'object', 'from', 'list'];
    return str[Random().nextInt(4)];
  }
}
