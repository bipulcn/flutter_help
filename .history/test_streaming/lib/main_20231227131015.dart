import 'dart:async';

import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void setValues(value) {
    setState(() {
      valueis = value;
    });
  }

  final StreamController<int> _streamController =
      StreamController<int>.broadcast();
  int valueis = 0;

  @override
  Widget build(BuildContext context) {
    Stream stream = _streamController.stream;
    stream.listen((event) {
      setValues(event);
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("This is the value of the stream listener is:"),
            Text(
              "$valueis",
            ),
            const SizedBox(height: 40),
            FilledButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                onPressed: () {
                  stream.listen((event) {
                    setValues(event);
                  });
                },
                child: const Text("subscribe")),
            MaterialButton(
                color: Colors.red[200],
                onPressed: () async {
                  await _streamController.close();
                  setValues(0);
                },
                child: const Text("Cancel Stream")),
            MaterialButton(
              onPressed: () {
                _streamController.add(12);
              },
              color: Colors.blue,
              child: const Text(
                "Add Values",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
