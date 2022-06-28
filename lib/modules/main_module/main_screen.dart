import 'package:example/app_colors.dart';
import 'package:example/app_texts.dart';
import 'package:flutter/material.dart';

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
        actions: [
          IconButton(onPressed: () {},
              icon: const Icon(Icons.search),),
        ],
      ),
      body: Center(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
