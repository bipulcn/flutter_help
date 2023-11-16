import 'package:flutter/material.dart';
import 'package:test_layout/pages/pageone.dart';
import 'package:test_layout/pages/pagethree.dart';
import 'package:test_layout/pages/pagetwo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: const BoxDecoration(color: Colors.white),
    //   child: const Center(
    //     child: Text(
    //       'Hello World',
    //       textDirection: TextDirection.ltr,
    //       style: TextStyle(
    //         fontSize: 32,
    //         color: Colors.black87,
    //       ),
    //     ),
    //   ),
    // );
    return MaterialApp(
      // debugShowMaterialGrid: true,
      // showSemanticsDebugger: true,
      debugShowCheckedModeBanner: false,
      // showPerformanceOverlay: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PageOne(),
      routes: {
        '/pageone': (context) => const PageOne(),
        '/pagetwo': (context) => const PageTwo(),
        '/pagethree': (context) => const PageThree(),
      },
      initialRoute: '/pageone',
    );
  }
}
