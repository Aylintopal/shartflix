class MovieModel {
  final String? id;
  final String? title;
  final String? description;
  final String? posterUrl;

  const MovieModel({this.id, this.title, this.description, this.posterUrl});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['Title'],
      description: json['Plot'],
      posterUrl: json['Poster'],
    );
  }
}
