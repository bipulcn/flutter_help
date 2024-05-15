import 'package:flutter/material.dart';
import 'package:test_blocs/bloc/BlocHome.dart';
import 'package:test_blocs/cubit/CubitHome.dart';
import 'package:test_blocs/provide/ProviderHome.dart';

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
      routes: {
        '/home': (context) => const MyHomePage(title: "This is Home page"),
        '/prov': (context) => const ProviderHome(),
        '/bloc': (context) => const BlocHome(),
        '/cubit': (context) => const CubitHome(),
      },
      initialRoute: "/home",
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
  List<pages> pgs = [
    pages(HomePage(), Icon(Icons.home)),
    pages(ProviderHome(), Icon(Icons.outbond)),
    pages(CubitHome(), Icon(Icons.chat_bubble)),
    pages(BlocHome(), Icon(Icons.gif_box_outlined)),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pgs.length,
      child: Scaffold(
        body: SafeArea(
          child: HomePage(),
          // child: TabBarView(children: pgs.map((k) => k.page).toList()),
        ),
        // bottomNavigationBar: menubar(),
      ),
    );
  }

  Widget menubar() {
    return Container(
        color: Colors.blueAccent,
        child: new TabBar(
            labelColor: Colors.blue[100],
            unselectedLabelColor: Colors.white70,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.blue,
            tabs: pgs.map((itm) => Tab(icon: itm.icon)).toList()));
  }
}

class pages {
  Widget page;
  Icon icon;
  pages(this.page, this.icon);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: const Text(
              'This will show the use of Provider, Cubit and BLOC in different pages',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Sample',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/prov");
                  },
                  child: Text("Provider")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/cubit");
                  },
                  child: Text("Cubit")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "/bloc");
                  },
                  child: Text("Bloc")),
            ],
          )
        ],
      ),
    );
  }
}
