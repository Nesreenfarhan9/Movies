class Movie {
  final String title;
  final String image;
  final double rating;
  final String genre;

  Movie({
    required this.title,
    required this.image,
    required this.rating,
    required this.genre,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"] ?? "Unknown",
      image: json["medium_cover_image"] ?? "",
      rating: (json["rating"] ?? 0).toDouble(),
      genre: (json["genres"] is List && (json["genres"] as List).isNotEmpty)
          ? (json["genres"] as List).first.toString() 
          : "Unknown", 
    );
  }
}

