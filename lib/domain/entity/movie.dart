import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 1)
class Movie {
  @HiveField(0)
  final String imageName;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;

  Movie({
    required this.imageName,
    required this.title,
    required this.description,
  });
}