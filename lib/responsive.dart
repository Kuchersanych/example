import 'package:flutter/material.dart';

/// Расчет одного процена ширины и высоты относительно экрана устройства.
class Responsive{
  static width(double percent,BuildContext context)
  {
    return MediaQuery.of(context).size.width * ( percent / 100 );
  }
  static height(double percent,BuildContext context)
  {
    return MediaQuery.of(context).size.height * ( percent / 100 );
  }
  static isTablet(BuildContext context)
  {
    return height( 100, context ) > 1000;
  }
}