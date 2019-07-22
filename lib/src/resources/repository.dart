import 'dart:async';
import 'movie_api_provider.dart';
import 'package:inject/inject.dart';
import '../models/state.dart';

class Repository {

  final MovieApiProvider _moviesApiProvider;

  @provide
  Repository(this._moviesApiProvider);

  Future<State> fetchAllMovies() => _moviesApiProvider.fetchMovieList();

  Future<State> fetchTrailers(int movieId) => _moviesApiProvider.fetchTrailer(movieId);
}
