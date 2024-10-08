import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_clean_coding/data/response/api_response.dart';
import 'package:equatable/equatable.dart';
import '../../models/movies/movies.dart';
import '../../repository/movies/movies_api_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesApiRepository moviesApiRepository;
  MoviesBloc({required this.moviesApiRepository}) : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<MoviesFetch>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi(MoviesFetch event, Emitter<MoviesState> emit) async {
    print('Fetching movies...');  // Debugging: Check when fetching starts
    await moviesApiRepository.fetchMoviesList().then((value) {
      print('Movies fetched successfully');
      emit(state.copyWith(
        moviesList: ApiResponse.completed(value),
      ));
    }).onError((error, stackTrace) {
      print('Error fetching movies: $error');  // Debugging: Log the error
      emit(state.copyWith(
        moviesList: ApiResponse.error(error.toString()),
      ));
    });
  }
}