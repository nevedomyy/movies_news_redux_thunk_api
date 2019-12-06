class Movie{
  final int id;
  final String title;
  final String overview;
  final int voteCount;
  final voteAverage;
  final String backdropPath;
  final int budget;
  final int revenue;
  final String releaseDate;

  Movie(
    this.id,
    this.title,
    this.overview,
    this.voteCount,
    this.voteAverage,
    this.backdropPath,
    this.budget,
    this.revenue,
    this.releaseDate
  );

  Movie.fromJSON(Map<String, dynamic> json)
    : id = json['id'],
      title = json['title'],
      overview = json['overview'],
      voteCount = json['vote_count'],
      budget = json['budget'],
      revenue = json['revenue'],
      releaseDate = json['release_date'],
      voteAverage = json['vote_average'],
      backdropPath = json['backdrop_path'];
}