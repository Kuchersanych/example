import 'package:example/app_colors.dart';
import 'package:example/responsive.dart';
import 'package:flutter/material.dart';

class Movie {
  final String? imageName;
  final String? title;
  final String? description;

  Movie({
    this.imageName,
    this.title,
    this.description,
  });
}

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemExtent: Responsive.height(25.0, context),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.width(2.0, context),
              vertical: Responsive.height(1.0, context)),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.movieWidgetColor,
                  border: Border.all(
                    color: AppColors.borderColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      blurRadius: 6,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                clipBehavior: Clip.hardEdge,
                child: Row(
                  children: [
                    Image.asset('images/screenshot.png'),
                    SizedBox(
                      width: Responsive.width(4.0, context),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Responsive.height(3.0, context),
                          ),
                          const Text(
                            'Название',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.textMenuColor,
                            ),
                          ),
                          SizedBox(
                            height: Responsive.height(2.0, context),
                          ),
                          const Text(
                            'Описание',
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.textMenuColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Material(
                color: AppColors.transparentColor,
                child: InkWell(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
