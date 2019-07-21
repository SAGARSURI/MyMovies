import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client, Response;
import '../models/item_model.dart';
import '../models/trailer_model.dart';
import 'package:inject/inject.dart';
import '../models/state.dart';

class MovieApiProvider {
  final Client client;
  final _apiKey = 'api-key';
  final _baseUrl = "http://api.themoviedb.org/3/movie";

  @provide
  MovieApiProvider(this.client);

  Future<State> fetchMovieList() async {
    Response response;
    if(_apiKey != 'api-key') {
       response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    }else{
      return State<String>.error('Please add your API key');
    }
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return State<ItemModel>.success(ItemModel.fromJson(json.decode(response.body)));
    } else {
      // If that call was not successful, throw an error.
      return State<String>.error(response.statusCode.toString());
    }
  }

  Future<State> fetchTrailer(int movieId) async {
    final response =
        await client.get("$_baseUrl/$movieId/videos?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return State<TrailerModel>.success(TrailerModel.fromJson(json.decode(response.body)));
    } else {
      return State<String>.error(response.statusCode.toString());
    }
  }
}
