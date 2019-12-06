import 'package:dio/dio.dart';
import '../model/movie_detail.dart';


class ApiProviderDetail {
  static final String _urlKey = 'xxxx';
  static final String _url1 = 'https://api.themoviedb.org/3/movie/';
  static final String _url2 = '?language=ru&api_key=';
  final Dio _dio = Dio();
  final int _movieID;

  ApiProviderDetail(this._movieID);

  Future<MovieDetail> getMovieDetail() async{
    try {
      Response response = await _dio.get(_url1+_movieID.toString()+_url2+_urlKey);
      return MovieDetail.fromJSON(response.data);
    } catch (e){
      return MovieDetail.withError(e.toString());
    }
  }
}