import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_cubit/movie/movie_cubit.dart';
import 'package:test_cubit/movie/movie_page.dart';
import 'package:test_cubit/movie/movie_repository.dart';
import 'package:test_cubit/otherone/accesscube.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          bottomNavigationBar: menu(),
          body: TabBarView(children: [
            BlocProvider<MoviesCubit>(
              create: (context) => MoviesCubit(
                repository: MovieRepository(
                  Dio(),
                ),
              ),
              child: const MoviesPage(),
            ),
            const AccessCube(),
            const Text("hello world"),
          ])),
    );
  }

  Widget menu() {
    return Container(
      color: Colors.blueAccent,
      child: const TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Colors.blue,
        tabs: [
          Tab(icon: Icon(Icons.oil_barrel)),
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
