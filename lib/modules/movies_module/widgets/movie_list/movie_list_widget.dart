import 'package:example/app_colors.dart';
import 'package:example/app_texts.dart';
import 'package:example/responsive.dart';
import 'package:flutter/material.dart';

class Movie {
  final String imageName;
  final String title;
  final String description;

  Movie({
    required this.imageName,
    required this.title,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {

   const MovieListWidget({Key? key}) : super(key: key);



  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      imageName: 'images/boys.jpg',
      title: 'Пацаны',
      description: 'Про супергероев',
    ),
    Movie(
      imageName: 'images/boys.jpg',
      title: 'Мера',
      description: 'Про супергероев',
    ),
    Movie(
      imageName: 'images/boys.jpg',
      title: 'Большой куш',
      description: 'Про супергероев',
    ),
    Movie(
      imageName: 'images/boys.jpg',
      title: 'Король',
      description: 'Про супергероев',
    ),
    Movie(
      imageName: 'images/boys.jpg',
      title: 'Бабы',
      description: 'Про супергероев',
    ),
    Movie(
      imageName: 'images/boys.jpg',
      title: 'Бабы',
      description: 'Про супергероев',
    ),
    Movie(
      imageName: 'images/boys.jpg',
      title: 'Бабы',
      description: 'Про супергероев',
    ),
    Movie(
      imageName: 'images/boys.jpg',
      title: 'Бабы',
      description: 'Про супергероев',
    ),
    Movie(
      imageName: 'images/boys.jpg',
      title: 'Бабы',
      description: 'Про супергероев',
    ),
  ];

  var _filteredMovies = <Movie> [];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if(query.isNotEmpty){
      _filteredMovies = _movies.where((Movie movie) {
       return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchMovies);
    _filteredMovies = _movies;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(top: Responsive.height(10.0, context)),
            itemCount: _filteredMovies.length,
            itemExtent: Responsive.height(25.0, context),
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
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
                          Image(image: AssetImage(movie.imageName)),
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
                                 Text(
                                  movie.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: AppColors.textMenuColor,
                                  ),
                                ),
                                SizedBox(
                                  height: Responsive.height(2.0, context),
                                ),
                                 Text(
                                  movie.description,
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
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
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        onTap: () {},
                      ),
                    ),

                  ],
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Responsive.height(1.3, context), vertical: Responsive.width(1.0, context)),
            child: TextFormField(
              controller: _searchController,
              style: const TextStyle(
                color: AppColors.textTextFormFieldColor,
              ),
              decoration: const InputDecoration(
                labelText: AppTexts.search,
                labelStyle: TextStyle(
                  color: AppColors.textTextFormFieldColor,
                ),
                filled: true,
                fillColor: AppColors.filledSearchColor,
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
