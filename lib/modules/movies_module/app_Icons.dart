import 'package:example/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppIcons{
  static const addMoviesIcon = Icon(Icons.add_circle_outline, size: 55.0,
  color: AppColors.iconAddVideosColor,
  );
  static const searchIcon = Icon(Icons.search);
  static const movies = Icon(Icons.movie_creation_sharp, size: 40,
  color: AppColors.iconBottomNavigationBarColor,);
  static const serials = Icon(Icons.movie_filter_outlined, size: 40,
    color: AppColors.iconBottomNavigationBarColor,);

  static const home = Icon(Icons.home, size: 40,
    color: AppColors.iconBottomNavigationBarColor,);
}