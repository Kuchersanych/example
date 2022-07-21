import 'package:example/app_colors.dart';
import 'package:example/app_texts.dart';
import 'package:example/modules/movies_module/add_movie_screen.dart';
import 'package:example/modules/movies_module/app_Icons.dart';
import 'package:example/modules/serials_module/serials_screen.dart';
import 'package:flutter/material.dart';

import '../movies_module/movies_screen.dart';
import '../serials_module/add_serials_screen.dart';
import 'menu_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedTab = 0;


  void onSelectedTab(int index){
    if(_selectedTab == index) return;
    setState((){
      _selectedTab = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title:
          AppTexts.look,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
        BottomNavigationBarItem(icon: AppIcons.home,
        label: AppTexts.menu,),
        BottomNavigationBarItem(icon: AppIcons.movies,
        label: AppTexts.movies,),
        BottomNavigationBarItem(icon: AppIcons.serials,
        label: AppTexts.serials,),
      ],
        onTap: onSelectedTab,

      ),
      body:
      IndexedStack(
        index: _selectedTab,
        children: const [
        MainMenuWidget(),
        MoviesScreen(),
        SerialsScreen(),
        ]
      ),

      floatingActionButton:  _selectedTab != 0 ? FloatingActionButton(
        backgroundColor: AppColors.backgroundColor,
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => _selectedTab == 1 ? const AddMovieScreen() : const AddSerialsScreen())),
        child: AppIcons.addMoviesIcon,
      ) : null,
    );
  }
}

class MainMenuWidget extends StatelessWidget {
  const MainMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Column(
          children:   [
            MenuWidget(icon: Icons.movie_creation_sharp, text: AppTexts.addMovie, onTap: (){final navigatorMovies =  Navigator.of(context);
            navigatorMovies.push(MaterialPageRoute(builder: (context) => const AddMovieScreen()));},),
            // MenuWidget(icon: Icons.movie_filter_outlined, text: AppTexts.serials, onTap: () {final navigatorSerials = Navigator.of(context);
            // navigatorSerials.push(MaterialPageRoute(builder: (context) => const SerialsScreen()));},),
          ],
        ),

    );
  }
}
