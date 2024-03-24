import 'package:flutter/material.dart';

class BackGrounds extends StatefulWidget {
  const BackGrounds({super.key, required this.title});

  final String title;

  @override
  State<BackGrounds> createState() => _BackGroundsState();
}

class _BackGroundsState extends State<BackGrounds> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/img/bg1.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(60, 8, 125, 235),
                      Color.fromARGB(60, 149, 33, 243)
                    ])),
                child: const Text("Hi"),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                decoration: BoxDecoration(
                    color: Colors.greenAccent.shade100.withAlpha(100),
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(color: Colors.green.shade100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.greenAccent.shade200,
                        spreadRadius: -15,
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      )
                    ]),
                child: const Text(
                  "Hello world",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              FloatingActionButton(
                onPressed: _incrementCounter,
                child: const Text("+"),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
