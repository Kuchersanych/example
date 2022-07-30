import 'package:example/modules/movies_module/widgets/movie_list/movie_list_widget.dart';
import 'package:example/modules/movies_module/widgets/movie_list/movie_screen_modal.dart';
import 'package:flutter/material.dart';

import '../../app_colors.dart';
import 'add_movie_screen.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final _model = MoviesScreenModel();
  @override
  Widget build(BuildContext context) {
    final moviesCount = MoviesScreenModelProvider.watch(context)?.model.movies.length ?? 0;
    return MoviesScreenModelProvider(model: _model,
    child: const _MoviesScreenBody());
  }
}


class _MoviesScreenBody extends StatelessWidget {
  const _MoviesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: MovieListWidget(),
      ),
    );
  }
  }

