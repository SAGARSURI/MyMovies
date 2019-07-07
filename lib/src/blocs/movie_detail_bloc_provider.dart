import 'package:flutter/material.dart';
import 'movie_detail_bloc.dart';
export 'movie_detail_bloc.dart';

class MovieDetailBlocProvider extends InheritedWidget {
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return null;
  }
//  final MovieDetailBloc bloc;
//
//  MovieDetailBlocProvider({Key key, Widget child})
//      : bloc = MovieDetailBloc(),
//        super(key: key, child: child);
//
//  @override
//  bool updateShouldNotify(_) {
//    return true;
//  }
//
//  static MovieDetailBloc of(BuildContext context) {
//    return (context.inheritFromWidgetOfExactType(MovieDetailBlocProvider)
//            as MovieDetailBlocProvider)
//        .bloc;
//  }
}
