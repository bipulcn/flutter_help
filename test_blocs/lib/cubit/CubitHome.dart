import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_blocs/cubit/cubeclass.dart';
import 'package:test_blocs/cubit/cubesubpage.dart';

class CubitHome extends StatefulWidget {
  const CubitHome({super.key});

  @override
  State<CubitHome> createState() => _CubitHomeState();
}

class _CubitHomeState extends State<CubitHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: BlocProvider<ObjCubit>(
            create: (context) => ObjCubit(),
            child: SafeArea(
                child: TabBarView(
              children: [CubeHome(), CubeSubPage()],
            ))),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.next_plan)),
          ],
        ),
      ),
    );
  }
}

class CubeHome extends StatelessWidget {
  const CubeHome({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ObjCubit>().state;
    return Scaffold(
      body: Container(
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cubit Page",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, "/home");
                      },
                      child: Text("Back")),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        context.read<ObjCubit>().randomWords();
                      },
                      child: Text("generate")),
                ],
              ),
            ),
            Container(
              color: Colors.amber.shade100,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$state"),
                    BlocBuilder<ObjCubit, String?>(builder: (context, state) {
                      return Text(state != null ? "$state" : "Click");
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
