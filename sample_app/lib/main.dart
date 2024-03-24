import 'package:flutter/material.dart';
import 'package:test_sample_app/pages/animationbasic.dart';
import 'package:test_sample_app/pages/backgrounds.dart';
import 'package:test_sample_app/pages/secondanimation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPageCont(),
    );
  }
}

class MainPageCont extends StatelessWidget {
  const MainPageCont({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: const TabBarView(children: [
            BackGrounds(title: "This is background page"),
            AnimationBasics(),
            SecondAnimation()
          ]),
          bottomNavigationBar: menu(),
        ));
  }

  Widget menu() {
    return Container(
        child: const TabBar(tabs: [
      Tab(icon: Icon(Icons.color_lens)),
      Tab(icon: Icon(Icons.animation)),
      Tab(icon: Icon(Icons.security_rounded))
    ]));
  }
}
