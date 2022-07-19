
import 'package:example/modules/movies_module/app_Icons.dart';
import 'package:example/modules/movies_module/widgets/movie_list/movie_list_widget.dart';

import 'package:flutter/material.dart';

import '../../app_colors.dart';
import 'add_movie_screen.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  void addVideos() {
    final navigatorMovies =  Navigator.of(context);
    navigatorMovies.push(MaterialPageRoute(builder: (context) => const AddMovieScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: MovieListWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backgroundColor,
        onPressed: addVideos,
        child: AppIcons.addMoviesIcon,

      ),
    );
  }
}
