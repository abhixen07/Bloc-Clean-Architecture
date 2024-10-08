import 'package:freezed_annotation/freezed_annotation.dart'; // Importing freezed_annotation package

part 'movies.freezed.dart'; // Importing generated code for Freezed classes
part 'movies.g.dart'; // Importing generated code for JSON serialization

/// Freezed class representing a list of movies.
@freezed
class MoviesModel with _$MoviesModel {
  /// Factory constructor for creating a [MovieListModel] instance.
  factory MoviesModel({
    @Default('') String total, // Total number of movies
    @Default(0) int page, // Current page number
    @Default(0) int pages, // Total number of pages
    @Default([]) @JsonKey(name: 'tv_shows') List<TvShows> tvShow, // List of TV shows
  }) = _MoviesModel; // Constructor for the freezed class

  /// Factory constructor for creating a [MovieListModel] instance from JSON.
  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json); // JSON deserialization method
}

/// Freezed class representing a TV show.
@freezed
class TvShows with _$TvShows {
  /// Factory constructor for creating a [TvShows] instance.
  factory TvShows({
    @JsonKey(name: 'name') @Default('') String name, // Name of the TV show
    @Default('') String permalink, // Permalink of the TV show
    @Default('') String endDate, // End date of the TV show
    @Default('') String network, // Network of the TV show
    @Default('') String imageThumbnailPath, // Image thumbnail path of the TV show
    @Default('') String status, // Status of the TV show
  }) = _TvShows; // Constructor for the freezed class

  /// Factory constructor for creating a [TvShows] instance from JSON.
  factory TvShows.fromJson(Map<String, dynamic> json) =>
      _$TvShowsFromJson(json); // JSON deserialization method
}