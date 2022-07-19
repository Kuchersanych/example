import 'package:example/app_colors.dart';
import 'package:example/app_texts.dart';
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
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: Responsive.height(10.0, context),
                  ),
                  TextFormField(
                    style: const TextStyle(
                      color: AppColors.textTextFormFieldColor,
                    ),
                    autofocus: true,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: Responsive.width(4.0, context),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Responsive.height(5.0, context)),
              child: ElevatedButton(
                onPressed: () {},
                child: AppTexts.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
