import 'package:example/responsive.dart';
import 'package:flutter/material.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemExtent: Responsive.height(10.0, context),
      itemBuilder: (BuildContext context, int index) {
      return Container(
        color: Colors.amber,
      );
    },);
  }
}

