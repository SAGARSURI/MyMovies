import 'package:rxdart/rxdart.dart';
import '../models/trailer_model.dart';
import '../resources/repository.dart';
import 'bloc_base.dart';
import 'package:inject/inject.dart';
import '../models/state.dart';

class MovieDetailBloc extends BlocBase {
  final Repository _repository;
  BehaviorSubject<TrailerModel> _trailers;

  Observable<TrailerModel> get movieTrailers => _trailers.stream;

  init() {
    _trailers = BehaviorSubject<TrailerModel>();
  }

  @provide
  MovieDetailBloc(this._repository);

  void fetchTrailersById(id) async {
    final state = await _repository.fetchTrailers(id);
    if (state is SuccessState) {
      _trailers.sink.add(state.value);
    } else {
      _trailers.addError((state as ErrorState).msg);
    }
  }

  @override
  dispose() async {
    await _trailers.drain();
    _trailers.close();
  }
}
