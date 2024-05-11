import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_cubit/lists/listfirstpage.dart';
import 'package:test_cubit/lists/listsecondpage.dart';
import 'package:test_cubit/lists/listthirdpage.dart';
import 'package:test_cubit/movie/movie_cubit.dart';
import 'package:test_cubit/movie/movie_page.dart';
import 'package:test_cubit/movie/movie_repository.dart';
import 'package:test_cubit/otherone/accesscube.dart';
import 'package:test_cubit/otherone/thridpage.dart';

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
      length: 6,
      child: Scaffold(
          bottomNavigationBar: menu(),
          body: TabBarView(children: [
            const Thirdpage(),
            // Takes a [Create] function that is responsible for creating the [Bloc] or [Cubit] and a [child] which will have access to the instance via BlocProvider.of(context). It is used as a dependency injection (DI) widget so that a single instance of a [Bloc] or [Cubit] can be provided to multiple widgets within a subtree.
            BlocProvider<MoviesCubit>(
              create: (context) => MoviesCubit(
                repository: MovieRepository(
                  Dio(),
                ),
              ),
              child: const MoviesPage(),
            ),
            const AccessCube(),
            const ListFirstPage(),
            const ListSecondPage(),
            const ListThirdPage(),
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
          Tab(icon: Icon(Icons.access_alarm)),
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.account_tree)),
          Tab(icon: Icon(Icons.vaccines)),
          Tab(icon: Icon(Icons.ac_unit)),
          Tab(icon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
