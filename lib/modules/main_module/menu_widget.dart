import 'package:example/app_colors.dart';
import 'package:example/modules/movies_module/movies_screen.dart';
import 'package:example/responsive.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;

  const MenuWidget({Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.all(Responsive.height(1.5, (context))),
        child: Row(
          children: [
            Icon(icon, size: Responsive.height(8.0, context), color: AppColors.iconMenuColor),
            const SizedBox(width: 25.0),
            Text(
              text,
              style: const TextStyle(
                fontSize: 25,
                color: AppColors.textMenuColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
