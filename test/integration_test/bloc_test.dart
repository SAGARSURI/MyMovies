import 'package:inject/inject.dart';
import 'package:my_movies/src/blocs/movies_bloc.dart';
import 'package:my_movies/src/blocs/movie_detail_bloc.dart';
import 'package:my_movies/src/models/item_model.dart';
import 'package:my_movies/src/models/trailer_model.dart';
import 'bloc_injector.dart';
import 'bloc_module.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  group("BloC testing", (){
    test("Movie BLoC testing", () async {
      var container = await BlocTestInjector.create(BlocModule());
      var moviesBloc = container.app.moviesBloc;
      moviesBloc.init();
      moviesBloc.fetchAllMovies();
      moviesBloc.allMovies.listen(expectAsync1((value){
        expect(value, isInstanceOf<ItemModel>());
      }));
    });
    test("Movie Detail BLoC testing", () async {
      var container = await BlocTestInjector.create(BlocModule());
      var moviesBloc = container.app.movieDetailBloc;
      moviesBloc.init();
      moviesBloc.fetchTrailersById(420818);
      moviesBloc.movieTrailers.listen(expectAsync1((value){
        expect(value, isInstanceOf<TrailerModel>());
      }));
    });
  });
}
class BlocTest{
  final MoviesBloc moviesBloc;
  final MovieDetailBloc movieDetailBloc;

  @provide
  BlocTest(this.moviesBloc, this.movieDetailBloc): super();

}