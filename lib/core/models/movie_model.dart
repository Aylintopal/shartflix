class MovieModel {
  final String? id;
  final String? title;
  final String? description;
  final String? posterUrl;
  final String? director;
  bool? isFavorite;

  MovieModel({
    this.id,
    this.title,
    this.description,
    this.posterUrl,
    this.director,
    this.isFavorite,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['Title'],
      description: json['Plot'],
      posterUrl: json['Poster'],
      director: json['Director'],
      isFavorite: json['isFavorite'],
    );
  }
}
