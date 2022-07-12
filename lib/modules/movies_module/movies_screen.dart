import 'package:example/app_texts.dart';
import 'package:example/modules/movies_module/appIcons.dart';
import 'package:example/responsive.dart';
import 'package:flutter/material.dart';

import '../../app_colors.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  void addVideos() {
    final navigatorMovies =  Navigator.of(context);
    navigatorMovies.push(MaterialPageRoute(builder: (context) => const MoviesScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTexts.movies),
        actions: [
          IconButton(onPressed: () {},
            icon: AppIcons.searchIcon),
        ],
      ),
      body: Center(
        child: Column(
          children:   [
            SizedBox(height: Responsive.height(3.0, context),),
            ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.backgroundColor,
        onPressed: addVideos,
        child: AppIcons.addMoviesIcon,

      ),
    );
  }
}
