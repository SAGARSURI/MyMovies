import 'bloc_injector.dart' as _i1;
import 'bloc_module.dart' as _i2;
import 'package:http/src/client.dart' as _i3;
import '../resources/movie_api_provider.dart' as _i4;
import '../resources/repository.dart' as _i5;
import 'dart:async' as _i6;
import '../app.dart' as _i7;
import '../blocs/movies_bloc.dart' as _i8;
import '../blocs/movie_detail_bloc.dart' as _i9;

class BlocInjector$Injector implements _i1.BlocInjector {
  BlocInjector$Injector._(this._blocModule);

  final _i2.BlocModule _blocModule;

  _i3.Client _singletonClient;

  _i4.MovieApiProvider _singletonMovieApiProvider;

  _i5.Repository _singletonRepository;

  static _i6.Future<_i1.BlocInjector> create(_i2.BlocModule blocModule) async {
    final injector = BlocInjector$Injector._(blocModule);

    return injector;
  }

  _i7.App _createApp() =>
      _i7.App(_createMoviesBloc(), _createMovieDetailBloc());
  _i8.MoviesBloc _createMoviesBloc() => _i8.MoviesBloc(_createRepository());
  _i5.Repository _createRepository() => _singletonRepository ??=
      _blocModule.repository(_createMovieApiProvider());
  _i4.MovieApiProvider _createMovieApiProvider() =>
      _singletonMovieApiProvider ??=
          _blocModule.movieApiProvider(_createClient());
  _i3.Client _createClient() => _singletonClient ??= _blocModule.client();
  _i9.MovieDetailBloc _createMovieDetailBloc() =>
      _i9.MovieDetailBloc(_createRepository());
  @override
  _i7.App get app => _createApp();
}
