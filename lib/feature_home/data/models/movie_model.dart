class Movie {
  final String title;
  final String image;
  final double rating;
  final String genre;
  final int id;

  Movie({
    required this.title,
    required this.image,
    required this.rating,
    required this.genre,
    required this.id
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      image: json["medium_cover_image"],
      rating: (json["rating"] as num).toDouble(),
      genre: json["genres"] != null && json["genres"].isNotEmpty
          ? json["genres"][0]
          : "Unknown",
      id: json['id'],
    );
  }
}
class MovieDetails {
  final int id;
  final String url;
  final String imdbCode;
  final String title;
  final String titleEnglish;
  final String titleLong;
  final String slug;
  final int year;
  final double rating;
  final int runtime;
  final List<String> genres;
  final int likeCount;
  final String descriptionIntro;
  final String descriptionFull;
  final String ytTrailerCode;
  final String language;
  final String backgroundImage;
  final String smallCoverImage;
  final String mediumCoverImage;
  final String largeCoverImage;
  final List<Torrent> torrents;
  final List<Actor> actors;
  bool isSaved;

  MovieDetails({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.likeCount,
    required this.descriptionIntro,
    required this.descriptionFull,
    required this.ytTrailerCode,
    required this.language,
    required this.backgroundImage,
    required this.smallCoverImage,
    required this.mediumCoverImage,
    required this.largeCoverImage,
    required this.torrents,
    required this.actors,
    this.isSaved = false,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      id: json['id'],
      url: json['url'],
      imdbCode: json['imdb_code'],
      title: json['title'],
      titleEnglish: json['title_english'],
      titleLong: json['title_long'],
      slug: json['slug'],
      year: json['year'],
      rating: json['rating'].toDouble(),
      runtime: json['runtime'],
      genres: List<String>.from(json['genres'] ?? []),
      likeCount: json['like_count'],
      descriptionIntro: json['description_intro'] ?? '',
      descriptionFull: json['description_full'] ?? '',
      ytTrailerCode: json['yt_trailer_code'] ?? '',
      language: json['language'] ?? 'Unknown',
      backgroundImage: json['background_image'] ?? '',
      smallCoverImage: json['small_cover_image'] ?? '',
      mediumCoverImage: json['medium_cover_image'] ?? '',
      largeCoverImage: json['large_cover_image'] ?? '',
      torrents: (json['torrents'] as List?)?.map((e) => Torrent.fromJson(e)).toList() ?? [],
      actors: (json['actors'] as List?)?.map((e) => Actor.fromJson(e)).toList() ?? [],
      isSaved: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'imdb_code': imdbCode,
      'title': title,
      'title_english': titleEnglish,
      'title_long': titleLong,
      'slug': slug,
      'year': year,
      'rating': rating,
      'runtime': runtime,
      'genres': genres,
      'like_count': likeCount,
      'description_intro': descriptionIntro,
      'description_full': descriptionFull,
      'yt_trailer_code': ytTrailerCode,
      'language': language,
      'background_image': backgroundImage,
      'small_cover_image': smallCoverImage,
      'medium_cover_image': mediumCoverImage,
      'large_cover_image': largeCoverImage,
      'actors': actors.map((e) => e.toJson()).toList(),
    };
  }
}

class Torrent {
  final String url;
  final String quality;
  final String type;
  final String videoCodec;
  final String audioChannels;
  final String size;
  final int seeds;
  final int peers;
  final String hash;

  Torrent({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
    required this.videoCodec,
    required this.audioChannels,
    required this.size,
    required this.seeds,
    required this.peers,
  });

  factory Torrent.fromJson(Map<String, dynamic> json) {
    return Torrent(
      url: json['url'],
      hash: json['hash'],
      quality: json['quality'],
      type: json['type'],
      videoCodec: json['video_codec'],
      audioChannels: json['audio_channels'],
      size: json['size'],
      seeds: json['seeds'],
      peers: json['peers'],
    );
  }
}

class Actor {
  final String name;
  final String character;
  final String imageUrl;

  Actor({
    required this.name,
    required this.character,
    required this.imageUrl,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      name: json['name'],
      character: json['character'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'character': character,
      'image_url': imageUrl,
    };
  }
}
