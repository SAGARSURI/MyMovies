import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = BehaviorSubject<ItemModel>();
  int totalPages = 1;

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies(int page) async {
    if (page <= totalPages) {
      ItemModel itemModel = await _repository.fetchAllMovies(page);
      if (_moviesFetcher.value == null) {
        totalPages = itemModel.total_pages;
        _moviesFetcher.sink.add(itemModel);
      } else {
        _moviesFetcher.value.results.addAll(itemModel.results);
        _moviesFetcher.sink.add(_moviesFetcher.value);
      }
    }
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
