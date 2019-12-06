class Movies{
  final int id;
  final String title;
  final voteAverage;
  final String posterPath;
  final String overview;

  Movies(
      this.id,
      this.title,
      this.voteAverage,
      this.posterPath,
      this.overview
  );

  Movies.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        voteAverage = json['vote_average'],
        posterPath = json['poster_path'],
        overview = json['overview'];
}