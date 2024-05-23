import 'package:flutter/material.dart';
import 'package:test_data/pages/dogs_page.dart';
import 'package:test_data/pages/questions.dart';

void main() async {
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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(children: [const QuestionPage(), const DogsPage()]),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.quiz)),
            Tab(icon: Icon(Icons.animation_outlined)),
          ],
        ),
      ),
    );
  }
}
