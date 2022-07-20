import 'package:example/app_colors.dart';
import 'package:example/app_texts.dart';
import 'package:example/modules/movies_module/add_movie_screen.dart';
import 'package:example/modules/movies_module/app_Icons.dart';
import 'package:example/modules/movies_module/movies_screen.dart';
import 'package:flutter/material.dart';

import '../movies_module/widgets/movie_list/movie_list_widget.dart';

class SerialsScreen extends StatefulWidget {
  const SerialsScreen({Key? key}) : super(key: key);


  @override
  State<SerialsScreen> createState() => _SerialsScreenState();
}

class _SerialsScreenState extends State<SerialsScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child:  MovieListWidget(),
      ),
    );
  }
}
