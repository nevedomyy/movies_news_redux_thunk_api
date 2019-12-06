import '../model/movie_detail.dart';
import '../model/movie_list.dart';


class GetListUpcoming{
  final MovieList _movieList;
  GetListUpcoming(this._movieList);
  MovieList get movieList => _movieList;
}

class GetListPlaying{
  final MovieList _movieList;
  GetListPlaying(this._movieList);
  MovieList get movieList => _movieList;
}

class GetMovieDetail{
  final MovieDetail _movieDetail;
  GetMovieDetail(this._movieDetail);
  MovieDetail get movieDetail => _movieDetail;
}

class ListLoading{
  MovieList get movieList => MovieList.loading();
}

class MovieDetailLoading{
  MovieDetail get movieDetail => MovieDetail.loading();
}