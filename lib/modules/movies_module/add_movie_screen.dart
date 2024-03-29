import 'package:example/app_colors.dart';
import 'package:example/app_texts.dart';
import 'package:example/modules/movies_module/app_Icons.dart';
import 'package:example/responsive.dart';
import 'package:flutter/material.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({Key? key}) : super(key: key);

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Добавить сериал',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
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
                      backgroundColor: MaterialStateProperty.all(AppColors.addButtonColor),),
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

class FormAddMovieWidget extends StatefulWidget {
  const FormAddMovieWidget({Key? key}) : super(key: key);

  @override
  State<FormAddMovieWidget> createState() => _FormAddMovieWidgetState();
}

class _FormAddMovieWidgetState extends State<FormAddMovieWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Responsive.height(5, context)),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: AppTexts.nameMovie,
              labelStyle: TextStyle(
                color: AppColors.textTextFormFieldColor,
              ),
            ),
          ),
          SizedBox(height: Responsive.height(5.0, context),),
          TextFormField(
            decoration: const InputDecoration(
              labelText: AppTexts.descriptionMovie,
              labelStyle: TextStyle(
                color: AppColors.textTextFormFieldColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
