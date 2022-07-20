
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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: MovieListWidget(),
      ),
    );
  }
}
