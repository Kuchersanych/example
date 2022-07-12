import 'package:example/app_colors.dart';
import 'package:example/app_texts.dart';
import 'package:example/modules/movies_module/appIcons.dart';
import 'package:example/modules/movies_module/movies_screen.dart';
import 'package:flutter/material.dart';

class SerialsScreen extends StatefulWidget {
  const SerialsScreen({Key? key}) : super(key: key);


  @override
  State<SerialsScreen> createState() => _SerialsScreenState();
}

class _SerialsScreenState extends State<SerialsScreen> {
  void addVideos() {
    final navigatorMovies =  Navigator.of(context);
    navigatorMovies.push(MaterialPageRoute(builder: (context) => const MoviesScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppTexts.serials),

      ),
      body: Center(
        child: Column(
          children: const [
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
