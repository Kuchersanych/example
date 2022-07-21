import 'package:example/app_colors.dart';
import 'package:example/app_texts.dart';
import 'package:example/modules/movies_module/app_Icons.dart';
import 'package:example/responsive.dart';
import 'package:flutter/material.dart';

import '../movies_module/add_movie_screen.dart';

class AddSerialsScreen extends StatefulWidget {
  const AddSerialsScreen({Key? key}) : super(key: key);

  @override
  State<AddSerialsScreen> createState() => _AddSerialsScreenState();
}

class _AddSerialsScreenState extends State<AddSerialsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добовить сериал',
        style: TextStyle(
          fontSize: 25
        ),),
      ),
      body: Center(

        child: ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: Responsive.height(10.0, context),
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: AppColors.textTextFormFieldColor,
                      ),
                      decoration: InputDecoration(
                          prefixIcon: AppIcons.searchIcon,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: Responsive.width(4.0, context),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          )),
                    ),
                    SizedBox(
                      height: Responsive.height(10.0, context),
                    ),
                    const FormAddMovieWidget(),
                    SizedBox(
                      height: Responsive.height(10.0, context),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.addButtonColor),
                      ),
                      onPressed: () {},
                      child: AppTexts.add,
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}


