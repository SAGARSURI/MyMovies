import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../models/state.dart';
import 'package:inject/inject.dart';
import 'bloc_base.dart';

class MoviesBloc extends BlocBase {
  final Repository _repository;
  PublishSubject<ItemModel> _moviesFetcher;

  @provide
  MoviesBloc(this._repository);

  init() {
    _moviesFetcher = PublishSubject<ItemModel>();
  }

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    State state = await _repository.fetchAllMovies();
    if (state is SuccessState) {
      _moviesFetcher.sink.add(state.value);
    } else if (state is ErrorState) {
      _moviesFetcher.addError(state.msg);
    }
  }

  @override
  dispose() {
    _moviesFetcher.close();
  }
}
