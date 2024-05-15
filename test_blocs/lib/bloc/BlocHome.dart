import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_blocs/bloc/bloc/blocclass.dart';
import 'package:test_blocs/bloc/bloc/blocevent.dart';
import 'package:test_blocs/bloc/blocsubpage.dart';

class BlocHome extends StatefulWidget {
  const BlocHome({super.key});

  @override
  State<BlocHome> createState() => _BlocHomeState();
}

class _BlocHomeState extends State<BlocHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (_) => BlocClass(),
        child: Scaffold(
          body: SafeArea(
              child: TabBarView(
            children: [HomeDetails(), BlocSubPage()],
          )),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(child: Text("home"), icon: Icon(Icons.home)),
              Tab(child: Text("home"), icon: Icon(Icons.skip_next))
            ],
          ),
        ),
      ),
    );
  }
}

class HomeDetails extends StatelessWidget {
  const HomeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var lst = context.watch<BlocClass>().name;
    return GridView.count(
      physics: ScrollPhysics(),
      crossAxisCount: 2,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("BLOC Page"),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  context.read<BlocClass>().add(NameChangeEvent());
                },
                child: Text("Reset")),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  context.read<BlocClass>().add(NameAppendEvent());
                },
                child: Text("Add Name")),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/home");
                },
                child: Text("Back"))
          ],
        ),
        Column(
          children: [
            SizedBox(height: 20),
            // Text("${lst}, ${lst.length}"),
            for (int i = 0; i < lst.length; i++) Text("${lst[i]}"),
          ],
        ),
        Container(
          color: Colors.amber.shade100,
          padding: EdgeInsets.all(20),
          child: ListView.builder(
              itemCount: lst.length,
              itemBuilder: (BuildContext context, int index) {
                return Text("${lst[index]}");
              }),
        ),
        Container(
          color: Colors.greenAccent.shade100,
        ),
        Container(
          color: Colors.greenAccent.shade200,
        ),
        Container(
          color: Colors.greenAccent.shade400,
        ),
        Container(
          color: Colors.greenAccent.shade700,
        ),
        Container(
          color: Colors.amber.shade100,
        ),
        Container(
          color: Colors.amber.shade200,
        ),
        Container(
          color: Colors.amber.shade300,
        ),
      ],
    );
  }
}
