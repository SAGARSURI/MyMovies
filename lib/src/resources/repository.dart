import 'dart:async';
import 'movie_api_provider.dart';
import '../models/item_model.dart';
import '../models/trailer_model.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies(int page) => moviesApiProvider.fetchMovieList(page);

  Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);
}
