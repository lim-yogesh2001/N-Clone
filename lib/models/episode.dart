
class Episode {
  final String id;
  final String name;
  final String length;
  final String url;
  final String movieId;
  final String coverImage;
  bool isTrailer = false;

  Episode(
    this.id,
    this.name,
    this.length,
    this.url,
    this.movieId,
    this.coverImage,
    this.isTrailer,
  );
}
