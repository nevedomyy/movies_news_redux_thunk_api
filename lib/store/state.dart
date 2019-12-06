import '../model/movie_detail.dart';
import '../model/movie_list.dart';


class AppState{
  final MovieList _movieList;
  final MovieDetail _movieDetail;
  final bool _firstBtn;

  AppState(
    this._movieList,
    this._movieDetail,
    this._firstBtn,
  );

  AppState.initial()
    : _movieList = MovieList.initial(),
      _movieDetail = MovieDetail.initial(),
      _firstBtn = true;

  MovieList get movieList => _movieList;
  MovieDetail get movieDetail => _movieDetail;
  bool get firstBtn => _firstBtn;
}