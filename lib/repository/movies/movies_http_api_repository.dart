import 'package:bloc_clean_coding/config/appurl/app_url.dart';

import '../../data/network/network_api_services.dart';
import '../../models/movies/movies.dart';
import 'movies_api_repository.dart';

class MoviesHttpApiRepository implements MoviesApiRepository {
  final _apiServices = NetworkApiServices();

  @override
  Future<MoviesModel> fetchMoviesList() async {
    final response = await _apiServices.getApi(AppUrl.popularMoviesListEndPoint);
    print('API Response: $response');  // Debugging: Print the response here
    return MoviesModel.fromJson(response);
  }
}