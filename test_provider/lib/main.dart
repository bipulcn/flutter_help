import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/firstpage.dart';
import 'package:test_provider/myprovider.dart';
import 'package:test_provider/secondpage.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Material(
      child: Container(
        color: Colors.green,
        child: Center(child: Text(details.exception.toString())),
      ),
    );
  };
  runApp(const MyApp());
  // runApp(MultiProvider(
  //     providers: [ChangeNotifierProvider(create: (_) => CounterProvider())],
  //     child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<CounterProvider>(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CounterProvider()),
          ChangeNotifierProvider(create: (_) => MyProvider())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const DefaultTabController(
            length: 2,
            child: MyHomePage(title: 'Flutter Demo Home Page '),
          ),
        ));
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
    // final provider = Provider.of<CounterProvider>(context);
    // final mycunt = Provider.of<MyProvider>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        bottomNavigationBar: Container(
          color: Colors.purple.shade200,
          child: const TabBar(tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_bike))
          ]),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    context.watch<CounterProvider>().count.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const FirstPage(),
                ],
              ),
            ),
            const SecondPage()
          ],
        )
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => provider.increment(),
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ),
        );
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
