import 'package:example/app_colors.dart';
import 'package:example/app_texts.dart';
import 'package:example/modules/movies_module/app_Icons.dart';
import 'package:example/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../domain/entity/movie.dart';
import 'movie_screen_modal.dart';



class MovieListWidget extends StatefulWidget {
  final int indexInList;
  const MovieListWidget({Key? key, required this.indexInList, }) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = <Movie>[

  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
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

    final movie = MoviesScreenModelProvider.read(context)!.model.movies[indexInList];
    final moviesCount = MoviesScreenModelProvider.watch(context)?.model.movies.length ?? 0;
    return SafeArea(
      child: Stack(
        children: [
          ListView.builder(

            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(top: Responsive.height(10.0, context)),


            itemCount: moviesCount,
            itemExtent: Responsive.height(25.0, context),
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (BuildContext context) {},
                      backgroundColor: AppColors.slidableDeleteColors,
                      foregroundColor: AppColors.slidableDeleteIconColors,
                      icon: AppIcons.slidableDeleteIcon,
                      label: AppTexts.delete,
                    ),
                  ],
                  // dismissible: DismissiblePane(onDismissed: () {}),
                ),
                child: Padding(
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
                            SizedBox(
                            width: Responsive.width(30.0, context),
                              child: Image(image: AssetImage(movie.imageName)),
                            ),
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
                ),
              );
            },
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: Responsive.width(2, context), vertical: Responsive.height(2.0, context)),
            child: TextFormField(
              controller: _searchController,
              style: const TextStyle(
                color: AppColors.textTextFormFieldColor,
              ),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),

                ),
                filled: true,
                fillColor: AppColors.filledSearchColor,
                prefixIcon: AppIcons.searchIcon,
                labelText: AppTexts.searchLabelText,
                labelStyle: const TextStyle(
                  color: AppColors.textTextFormFieldColor,
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: Responsive.width(4.0, context),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),

                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}


// Movie(
//   imageName: 'images/movie.png',
//   title: 'Interstellar',
//   description: 'Про азбуку Морзе',
// ),
// Movie(
//   imageName: 'images/movie.png',
//   title: 'Interstellar',
//   description: 'Про азбуку Морзе',
// ),
// Movie(
//   imageName: 'images/movie.png',
//   title: 'Interstellar',
//   description: 'Про азбуку Морзе',
// ),
// Movie(
//   imageName: 'images/movie.png',
//   title: 'Interstellar',
//   description: 'Про азбуку Морзе',
// ),
// Movie(
//   imageName: 'images/movie.png',
//   title: 'Interstellar',
//   description: 'Про азбуку Морзе',
// ),
// Movie(
//   imageName: 'images/movie.png',
//   title: 'Interstellar',
//   description: 'Про азбуку Морзе',
// ),
// Movie(
//   imageName: 'images/movie.png',
//   title: 'Interstellar',
//   description: 'Про азбуку Морзе',
// ),
