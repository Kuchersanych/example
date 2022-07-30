import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


import '../../../../domain/entity/movie.dart';

class MoviesScreenModel extends ChangeNotifier{
  var _movies = <Movie>[];

  List<Movie> get movies => _movies.toList();

  MoviesScreenModel(){
    _setup();
  }

  void _readMoviesScreenFromHive(Box<Movie> box){

    _movies = box.values.toList();
    notifyListeners();

  }

  void _setup() async {
    if(!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(MovieAdapter());
    }

    final box = await Hive.openBox<Movie>('movie_box');
    _readMoviesScreenFromHive(box);
    box.listenable().addListener(() => _readMoviesScreenFromHive(box));


    }

  }


class MoviesScreenModelProvider extends InheritedNotifier {
  final MoviesScreenModel model;
  const MoviesScreenModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key,
      notifier: model,
      child: child);

  static MoviesScreenModelProvider? watch (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<
        MoviesScreenModelProvider>();
  }

    static MoviesScreenModelProvider? read (BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<MoviesScreenModelProvider>()?.widget;
    return widget is MoviesScreenModelProvider ? widget : null;
    }

  }



