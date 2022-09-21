import 'package:flutter/material.dart';
import '../models/episode.dart';

class EpisodeProvider with ChangeNotifier {
  final List<Episode> _episodes = [
    Episode(
      'e1',
      'One Piece Movie: Red',
      '1hr 30min',
      'movielink',
      'm2',
      'https://gaamagazine.com/wp-content/uploads/2022/08/Where-To-Watch-One-Piece-Film-Red-Online.jpg',
      false,
    ),
    Episode(
      'e2',
      'The Deathly Hallows: part 1',
      '2hrs',
      'movielink',
      'm3',
      'https://m.media-amazon.com/images/M/MV5BMTU1MTk5OTAxOF5BMl5BanBnXkFtZTcwOTEyODgwNA@@._V1_.jpg',
      false,
    ),
    Episode(
      'e3',
      'The Deathly Hallows: part 2',
      '2hrs',
      'movielink',
      'm3',
      'https://cdn.wionews.com/sites/default/files/styles/story_page/public/2022/07/29/282974-harrypotter.png',
      false,
    ),
    Episode(
      'e4',
      'The Lost Woods',
      '45min',
      'ep link',
      'm1',
      'https://upload.wikimedia.org/wikipedia/en/c/c9/Geralt_of_Rivia_Witcher.png',
      false,
    ),
    Episode(
      'e4',
      'Know Your Place',
      '45min',
      'ep link',
      'm1',
      'https://cdn.vox-cdn.com/thumbor/cvMtJlwFhNYIUg413Ye9iBQ84rE=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23078397/witcher_season_2_review.jpg',
      false,
    ),
    Episode(
      'e4',
      'Looking Good',
      '45min',
      'ep link',
      'm1',
      'https://cdn.vox-cdn.com/thumbor/XrTPYbTzdEiRUjrjdN7FD0_XA9c=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19569082/TheWitcher_101_Unit_08529_RT.pkej748hf.jpg',
      false,
    ),Episode(
      'e4',
      'Looking Good',
      '1.5min',
      'ep link',
      'm1',
      'https://cdn.vox-cdn.com/thumbor/XrTPYbTzdEiRUjrjdN7FD0_XA9c=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19569082/TheWitcher_101_Unit_08529_RT.pkej748hf.jpg',
      true,
    )
  ];

  get episodes {
    return [..._episodes];
  }

  List<Episode> filteredEpisodes(String movieId){
    return [..._episodes.where((element) => element.movieId == movieId && element.isTrailer == false)];
  }

  List<Episode> trailers(String movieId){
    return [..._episodes.where((element) => element.isTrailer == true && element.movieId == movieId)];
  }
}
