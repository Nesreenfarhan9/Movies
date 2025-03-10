class Movie {
  final String title;
  final String image;
  final double rating;
  final String genre; // تأكد من أن هذه الخاصية موجودة

  Movie({
    required this.title,
    required this.image,
    required this.rating,
    required this.genre, 
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      image: json["medium_cover_image"],
      rating: (json["rating"] as num).toDouble(),
      genre: json["genres"] != null && json["genres"].isNotEmpty
          ? json["genres"][0] 
          : "Unknown", 
    );
  }
}

