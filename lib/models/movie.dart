class Movie {
  final String id;
  final String name;
  final String imageUrl;
  bool popular;
  bool trending;
  bool isComingSoon;
  final String category;
  final String season;
  final DateTime releaseDate;
  final String description;
  final String cast;
  final String producer;

  Movie(
    this.id,
    this.name,
    this.imageUrl,
    this.popular,
    this.trending,
    this.isComingSoon,
    this.category,
    this.season,
    this.releaseDate,
    this.description,
    this.cast,
    this.producer
  );
}
