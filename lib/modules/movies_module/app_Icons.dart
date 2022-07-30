import 'package:example/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppIcons {
  static const addMoviesIcon = Icon(
    Icons.add_circle_outline,
    size: 55.0,
    color: AppColors.iconAddVideosColor,
  );
  static const searchIcon = Icon(Icons.search, color: AppColors.labelTextFieldColor,);
  static const moviesIcon = Icon(
    Icons.movie_creation_sharp,
    size: 40,
    color: AppColors.iconBottomNavigationBarColor,
  );
  static const serialsIcon = Icon(
    Icons.movie_filter_outlined,
    size: 40,
    color: AppColors.iconBottomNavigationBarColor,
  );

  static const homeIcon = Icon(
    Icons.home,
    size: 40,
    color: AppColors.iconBottomNavigationBarColor,
  );
  static const slidableDeleteIcon = Icons.delete;
  static const createNameIcon = Icon(Icons.create, color: AppColors.iconCreateNameColor,);
  static const createDescriptionIcon = Icon(Icons.border_color, color: AppColors.iconCreateDescriptionColor,);
}
