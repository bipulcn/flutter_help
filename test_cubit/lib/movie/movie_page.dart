import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_cubit/movie/movie_cubit.dart';
import 'package:test_cubit/movie/movie_state.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});
  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movies'),
      ),
      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Icon(Icons.close),
            );
          } else if (state is LoadedState) {
            final movies = state.movies;

            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(movies[index].title),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(movies[index].urlImage),
                  ),
                  subtitle: Text(movies[index].votes),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
