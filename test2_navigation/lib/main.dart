import 'package:flutter/material.dart';
import 'package:test2_navigation/pgone.dart';
import 'package:test2_navigation/pgthree.dart';
import 'package:test2_navigation/pgtwo.dart';

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
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
        '/first': (context) => const PageOne(),
        '/second': (context) => const PageTwo(),
        '/third': (context) => const PageThree(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'), // When router was declared it does not required
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'You are going to route \nbetween screens',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PageTwo()));
              },
              child: const Text("Go To Second page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              child: const Text("Go To Third page"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/first");
                // Navigator.popUntil(context, ModalRoute.withName('/first'));

                // Navigator.pushNamed(context, '/first');
              },
              child: const Text("Go To page one"),
            ),
          ],
        ),
      ),
    );
  }
}

// class SecondScreen extends StatelessWidget {

// }

// class ThirdScreen extends StatelessWidget {
  
// }
