import 'package:example/app_colors.dart';
import 'package:example/app_texts.dart';
import 'package:example/modules/serials_module/serials_screen.dart';
import 'package:flutter/material.dart';

import '../movies_module/movies_screen.dart';
import 'menu_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title:
          AppTexts.look,
      ),
      body: Center(
        child: Column(
          children:   [
              MenuWidget(icon: Icons.movie_creation_sharp, text: AppTexts.movies, onTap: (){final navigatorMovies =  Navigator.of(context);
              navigatorMovies.push(MaterialPageRoute(builder: (context) => const MoviesScreen()));},),
              MenuWidget(icon: Icons.movie_filter_outlined, text: AppTexts.serials, onTap: () {final navigatorSerials = Navigator.of(context);
                navigatorSerials.push(MaterialPageRoute(builder: (context) => const SerialsScreen()));},),
          ],
        ),
      ),
    );
  }
}
