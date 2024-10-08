import 'package:bloc_clean_coding/models/movies/movies.dart';

abstract class MoviesApiRepository {
   Future<MoviesModel> fetchMoviesList();
}