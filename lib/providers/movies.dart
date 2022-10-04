import 'package:flutter/material.dart';
import 'movie.dart';

class MovieProvider with ChangeNotifier {
  final List<Movie> _movieList = [
    Movie(
        "m1",
        "The Witcher",
        "https://pics.filmaffinity.com/The_Witcher_TV_Series-330642357-large.jpg",
        true,
        false,
        false,
        false,
        "TV Show",
        "2nd Season",
        DateTime.now(),
        "Geralt of Rivia, a solitary monster hunter, struggles to find his place in a world where people often prove more wicked than beasts. The Witcher is a fantasy drama web television series created by Lauren Schmidt Hissrich for Netflix.",
        "Henry Cavill, Mimi Ndiweni, Anna Shaffer",
        "Andrzej Sapkowski"),
    Movie(
        "m2",
        "One Piece Flim Red",
        "https://cdn.animenewsnetwork.com/thumbnails/max650x650/cms/news.5/184125/one-piece-film-red-visual.jpg",
        true,
        true,
        false,
        false,
        "Movie",
        "1st Season",
        DateTime.now(),
        "One Piece Film: Red is a 2022 Japanese animated fantasy action-adventure film directed by Gorō Taniguchi and produced by Toei Animation. It is the fifteenth feature film of the One Piece film series, based on the manga of the same name written and illustrated by Eiichiro Oda.",
        "Shūichi Ikeda, Yuki Yamada, Akemi Okamura",
        "Eiichiro Oda"),
    Movie(
        "m3",
        "Harry Potter And The Deathly Hallows",
        "https://m.media-amazon.com/images/M/MV5BMTQ2OTE1Mjk0N15BMl5BanBnXkFtZTcwODE3MDAwNA@@._V1_.jpg",
        true,
        true,
        false,
        false,
        "Movie",
        "2nd Season",
        DateTime.now(),
        "The Deathly Hallows is about Harry Potter and his friends finding ways to destroy Voldemort. They learn that even good contains a bit of evil, and vise versa. Even though the trio faces many difficulties, they persevere.",
        "Ralph Fiennes, Bonnie Wright, Jamie Campbell Bower",
        "J. K. Rowling"),
    Movie(
        "m4",
        "The Vikings",
        "https://m.media-amazon.com/images/M/MV5BODk4ZjU0NDUtYjdlOS00OTljLTgwZTUtYjkyZjk1NzExZGIzXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg",
        true,
        false,
        false,
        false,
        "TV Show",
        "Movie",
        DateTime.now(),
        "The Vikings were made up of landowning chieftains and clan heads, their retainers, freemen, and any energetic young clan members who sought adventure and booty overseas. At home these Scandinavians were independent farmers, but at sea they were raiders and pillagers.",
        "Travis Fimmel, Lagertha, Rollo",
        "Michael Hirst"),
    Movie(
        "m6",
        "Prem Geet 3",
        "https://i1.sndcdn.com/artworks-MzHnj4noDMNaNugV-hyuzbw-t500x500.jpg",
        false,
        true,
        true,
        false,
        "Movie",
        "1st Season",
        DateTime.now(),
        "The Vikings were made up of landowning chieftains and clan heads, their retainers, freemen, and any energetic young clan members who sought adventure and booty overseas. At home these Scandinavians were independent farmers, but at sea they were raiders and pillagers.",
        "Travis Fimmel, Lagertha, Rollo",
        "Michael Hirst"),
    Movie(
        "m5",
        "She Hulk",
        "https://thedisinsider.com/wp-content/uploads/2022/07/scale.jpg",
        false,
        true,
        true,
        false,
        "Movie",
        "1st Season",
        DateTime.now(),
        "The Vikings were made up of landowning chieftains and clan heads, their retainers, freemen, and any energetic young clan members who sought adventure and booty overseas. At home these Scandinavians were independent farmers, but at sea they were raiders and pillagers.",
        "Travis Fimmel, Lagertha, Rollo",
        "Michael Hirst"),
  ];

  bool rate = false;
  final trendingMovies = [];
  var searchMovies = [];

  get getPopularMovies {
    return [..._movieList.where((element) => element.popular == true).toList()];
  }

  get getTrendingMovies {
    return [
      ..._movieList.where((element) => element.trending == true).toList()
    ];
  }

  get trendingMovieList {
    return [...trendingMovies];
  }

  get comingSoonShows {
    return [..._movieList.where((element) => element.isComingSoon == true)];
  }

  get tvShows{
    return [..._movieList.where((element) => element.category == 'TV Shows')];
  }

  get movieList {
    return [..._movieList.where((element) => element.category == 'Movie')];
  }

  Movie findMovieById(String id) {
    return _movieList.firstWhere((element) => element.id == id);
  }
 
  void updateMovieList(String name) {
    searchMovies = _movieList.where((element) => element.name.toLowerCase().contains(name.toLowerCase())).toList();
    notifyListeners();
  }

}