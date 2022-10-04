import 'package:flutter/material.dart';

class Movie with ChangeNotifier {
  final String id;
  final String name;
  final String imageUrl;
  bool popular;
  bool trending;
  bool isComingSoon;
  bool rate;
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
    this.rate,
    this.category,
    this.season,
    this.releaseDate,
    this.description,
    this.cast,
    this.producer
  );

  void toggleRate(){
    rate = !rate;
    notifyListeners();
  }
}
