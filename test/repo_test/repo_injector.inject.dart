import 'repo_injector.dart' as _i1;
import 'repo_module.dart' as _i2;
import 'package:http/src/client.dart' as _i3;
import 'package:my_movies/src/resources/movie_api_provider.dart' as _i4;
import 'dart:async' as _i5;
import 'repo_test.dart' as _i6;

class RepoTestInjector$Injector implements _i1.RepoTestInjector {
  RepoTestInjector$Injector._(this._repoModule);

  final _i2.RepoModule _repoModule;

  _i3.Client _singletonClient;

  _i4.MovieApiProvider _singletonMovieApiProvider;

  static _i5.Future<_i1.RepoTestInjector> create(
      _i2.RepoModule repoModule) async {
    final injector = RepoTestInjector$Injector._(repoModule);

    return injector;
  }

  _i6.RepoTest _createRepoTest() =>
      _i6.RepoTest(_createMovieApiProvider(), _createClient());
  _i4.MovieApiProvider _createMovieApiProvider() =>
      _singletonMovieApiProvider ??=
          _repoModule.movieApiProvider(_createClient());
  _i3.Client _createClient() => _singletonClient ??= _repoModule.client();
  @override
  _i6.RepoTest get app => _createRepoTest();
}
