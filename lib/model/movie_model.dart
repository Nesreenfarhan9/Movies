class Movie {
  final String title;
  final String image;
  final double rating;

  Movie({required this.title, required this.image, required this.rating});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      image: json['medium_cover_image'],
      rating: json['rating'].toDouble(),
    );
  }
}
