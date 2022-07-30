import 'package:example/app_colors.dart';
import 'package:example/app_texts.dart';
import 'package:example/modules/movies_module/app_Icons.dart';
import 'package:example/modules/movies_module/widgets/add_movie_screen_model.dart';
import 'package:example/responsive.dart';
import 'package:flutter/material.dart';

class AddSerialScreen extends StatefulWidget {
  const AddSerialScreen({Key? key}) : super(key: key);

  @override
  State<AddSerialScreen> createState() => _AddSerialScreenState();
}

class _AddSerialScreenState extends State<AddSerialScreen> {
  final _model = AddMovieScreenModel();
  @override
  Widget build(BuildContext context) {
    return  AddMovieScreenModelProvider(
        model: _model,
        child:  const AddMovieScreenBody());
  }
}


class AddMovieScreenBody extends StatelessWidget {
  const AddMovieScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            AppTexts.addSerial,
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
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: Responsive.width(2.0, context), vertical: Responsive.height(2.0, context)),
                    child: TextFormField(
                      style: const TextStyle(
                        color: AppColors.textTextFormFieldColor,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0)
                        ),
                        filled: true,
                        fillColor: AppColors.filledSearchColor,
                          prefixIcon: AppIcons.searchIcon,

                          labelText: AppTexts.searchLabelText,
                          labelStyle: const TextStyle(
                            color: AppColors.labelTextFieldColor,

                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: Responsive.width(4.0, context),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0),
                            ),

                          ),
                      ),
                    ),
                  ),


                  const FormAddSerialWidget(),

                ],
              ),
            ],
          ),
        ),
        floatingActionButton:  FloatingActionButton(
          backgroundColor: AppColors.backgroundColor,
          onPressed: () => AddMovieScreenModelProvider.read(context)?.model.saveMovie(context),
          child: AppIcons.addMoviesIcon,
        )
    );
  }
}



class FormAddSerialWidget extends StatefulWidget {
  const FormAddSerialWidget({Key? key}) : super(key: key);

  @override
  State<FormAddSerialWidget> createState() => _FormAddSerialWidgetState();
}

class _FormAddSerialWidgetState extends State<FormAddSerialWidget> {
  @override
  Widget build(BuildContext context) {
    final model = AddMovieScreenModelProvider.read(context)?.model;
    return Padding(
      padding: EdgeInsets.all(Responsive.height(5, context)),
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(
              color: AppColors.textTextFormFieldColor,
              fontSize: 25
            ),
            onChanged: (value) => model?.movieName = value,
            onEditingComplete: () => AddMovieScreenModelProvider.read(context)?.model.saveMovie(context),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderAddTextFieldColor)
              ),
              filled: true,
              fillColor: AppColors.filledAddColor,
              prefixIcon: AppIcons.createNameIcon,
              labelText: AppTexts.nameSerial,
              labelStyle: TextStyle(
                color: AppColors.textTextFormFieldColor,
                fontSize: 16
              ),
            ),
          ),
          SizedBox(height: Responsive.height(5.0, context),),
          TextFormField(
            style: const TextStyle(
                color: AppColors.textTextFormFieldColor,
                fontSize: 25
            ),
            onChanged: (value) => model?.movieName = value,
            onEditingComplete: () => model?.saveMovie(context),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.borderAddTextFieldColor)
              ),
              prefixIcon: AppIcons.createDescriptionIcon,
              filled: true,
              fillColor: AppColors.filledAddColor,
              labelText: AppTexts.description,
              labelStyle: TextStyle(
                color: AppColors.textTextFormFieldColor,
                fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }
}


