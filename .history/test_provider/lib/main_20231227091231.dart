import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/firstpage.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CounterProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page ${provider.count}'),
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
    final provider = Provider.of<CounterProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              provider.count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Provider<MyProvider>(
              create: (_) => MyProvider(),
              child: FirstPage(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyProvider extends ChangeNotifier {
  MyProvider();
  var _count = 0;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}

class CounterProvider extends ChangeNotifier {
  CounterProvider();
  var _count = 10;
  int get count => _count;
  void increment() {
    _count++;
    notifyListeners();
  }
}
