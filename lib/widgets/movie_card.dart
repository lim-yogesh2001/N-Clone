import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/movie_details.dart';

class MovieCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  const MovieCard({required this.id, required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      height: 100,
      width: 120,
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(MovieDetails.routeName, arguments: id),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LargeMovieCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String movieName;
  const LargeMovieCard(
      {required this.id,
      required this.imageUrl,
      required this.movieName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              margin: const EdgeInsets.only(bottom: 5.0, top: 5.0, left: 2.0, right: 2.0),
              height: 125,
              width: MediaQuery.of(context).size.width * 0.6,
              child: GestureDetector(
                onTap: () => Navigator.of(context)
                    .pushNamed(MovieDetails.routeName, arguments: id),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              movieName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
        ],
      ),
    );
  }
}
