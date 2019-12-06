import 'package:dio/dio.dart';
import '../model/movie_list.dart';


class ApiProviderList {
  static final String _urlKey = 'xxxx';
  static final String _url1 = 'https://api.themoviedb.org/3/movie/';
  static final String _url2 = '?language=ru&api_key=';
  final Dio _dio = Dio();

  Future<MovieList> getListUpcoming() async{
    try {
      Response response = await _dio.get(_url1+'upcoming'+_url2+_urlKey);
      return MovieList.fromJSON(response.data);
    } catch (e){
      return MovieList.withError(e.toString());
    }
  }

  Future<MovieList> getListPlaying() async{
    try {
      Response response = await _dio.get(_url1+'now_playing'+_url2+_urlKey);
      return MovieList.fromJSON(response.data);
    } catch (e){
      return MovieList.withError(e.toString());
    }
  }
}