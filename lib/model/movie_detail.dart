import 'movie.dart';


class MovieDetail{
  final Movie movie;
  final String error;
  final bool isLoading;

  MovieDetail(
    this.movie,
    this.error,
    this.isLoading
  );

  MovieDetail.fromJSON(Map<String, dynamic> json)
    : movie = Movie.fromJSON(json),
      error = null,
      isLoading = false;

  MovieDetail.withError(String error)
    : movie = null,
      error = error,
      isLoading = false;

  MovieDetail.loading()
      : movie = null,
        error = null,
        isLoading = true;

  MovieDetail.initial()
    : movie = null,
      error = null,
      isLoading = false;
}