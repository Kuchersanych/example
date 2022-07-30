

import 'package:example/domain/entity/movie.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddMovieScreenModel {

  var movieName ='';

  void saveMovie(BuildContext context) async{
    if(movieName.isEmpty) return;
   if(!Hive.isAdapterRegistered(1)) {
     Hive.registerAdapter(MovieAdapter());

   }
   final box = await Hive.openBox<Movie>('movie_box');
   final movie = Movie(imageName: '', title: movieName, description: '');
   await box.add(movie);
   Navigator.of(context).pop();
  }


}

class AddMovieScreenModelProvider extends InheritedWidget {
  final AddMovieScreenModel model;
  const AddMovieScreenModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);
  static AddMovieScreenModelProvider? watch (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AddMovieScreenModelProvider>();
  }

  static AddMovieScreenModelProvider? read(BuildContext context){
    final widget = context.getElementForInheritedWidgetOfExactType<AddMovieScreenModelProvider>()
        ?.widget;
    return widget is AddMovieScreenModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(AddMovieScreenModelProvider) {
    return true;
  }




}
