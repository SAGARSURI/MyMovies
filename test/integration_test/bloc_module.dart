import 'package:inject/inject.dart';
import 'package:my_movies/src/blocs/movies_bloc.dart';
import 'package:my_movies/src/blocs/movie_detail_bloc.dart';
import 'package:my_movies/src/blocs/bloc_base.dart';
import 'package:my_movies/src/resources/repository.dart';
import 'package:my_movies/src/resources/movie_api_provider.dart';
import 'package:http/http.dart' show Client;

@module
class BlocModule{

  @provide
  @singleton
  Client client() => Client();

  @provide
  @singleton
  MovieApiProvider movieApiProvider(Client client) => MovieApiProvider(client);

  @provide
  @singleton
  Repository repository(MovieApiProvider movieApiProvider) => Repository(movieApiProvider);

  @provide
  BlocBase movieBloc(Repository repository) => MoviesBloc(repository);

  @provide
  BlocBase movieDetailBloc(Repository repository) => MovieDetailBloc(repository);
}