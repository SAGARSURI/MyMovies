import 'dart:async';
import 'movie_api_provider.dart';
import '../models/item_model.dart';
import '../models/trailer_model.dart';
import 'package:inject/inject.dart';

class Repository {

  final MovieApiProvider moviesApiProvider;

  @provide
  Repository(this.moviesApiProvider);

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);
}
