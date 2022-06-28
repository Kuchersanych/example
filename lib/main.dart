import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'modules/main_module/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      home:  MainScreen(),
    );
  }
}

///

/*
1) Создание ветки из текущей
2) Внесение изминений в вновь созданную - RollBack
3) Commit - вкладка
4) Add to VCS
5) Указать комментарий
6) Нажал Commit - действие
7) Checkout в ту ветку с которой ходим смержить
8) Merge Selected into Current
9) Push
10) Можно удалить второстепенную ветку
 */