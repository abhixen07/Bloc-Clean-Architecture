part of 'movies_bloc.dart';


class MoviesState extends Equatable {

  const MoviesState({
    required this.moviesList ,
  }) ;

  final ApiResponse<MoviesModel> moviesList  ;

  MoviesState copyWith({
    ApiResponse<MoviesModel>? moviesList,
  }) {
    return MoviesState(
      moviesList: moviesList ?? this.moviesList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [moviesList];
}

