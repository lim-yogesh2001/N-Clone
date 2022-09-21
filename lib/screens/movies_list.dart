import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/movie_card.dart';
import '../providers/movie.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    final movieData = Provider.of<MovieProvider>(context, listen: false).movieList;
    return GridView.builder(
      itemCount: movieData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 1/1.5,
      ),
      itemBuilder: (context, i) =>
          MovieCard(id: movieData[i].id, imageUrl: movieData[i].imageUrl),
    );
  }
}
