import 'movies.dart';


class MovieList{
  final List<Movies> list;
  final String error;
  final bool isLoading;

  MovieList(
    this.list,
    this.error,
    this.isLoading
  );

  MovieList.fromJSON(Map<String, dynamic> json)
    : list = (json['results'] as List).map((i) => Movies.fromJSON(i)).toList(),
      error = null,
      isLoading = false;

  MovieList.withError(String error)
    : list = null,
      error = error,
      isLoading = false;

  MovieList.loading()
      : list = null,
        error = null,
        isLoading = true;

  MovieList.initial()
    : list = null,
      error = null,
      isLoading = false;
}