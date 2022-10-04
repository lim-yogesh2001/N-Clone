import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/movie_details.dart';
import 'package:provider/provider.dart';
import '../widgets/search_item.dart';
import '../providers/movies.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    var movieData = movieProvider.searchMovies;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10.0,
          ),
          TextField(
            onChanged: (value) => movieProvider.updateMovieList(value),
            decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(96, 32, 43, 76),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.red,
                ),
                hintText: "Search Movie",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0))),
            keyboardType: TextInputType.name,
            style: const TextStyle(
                fontFamily: 'Rubik',
                // color: Colors.redj
                fontSize: 18.0),
          ),
          const SizedBox(
            height: 10.0,
          ),
          if (movieData.isNotEmpty)
            Expanded(
              child: ListView.builder(
                  itemCount: movieData.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                          MovieDetails.routeName,
                          arguments: movieData[i].id),
                      child: SearchItem(
                        movieName: movieData[i].name,
                        imageUrl: movieData[i].imageUrl,
                        releaseDate: movieData[i].releaseDate,
                      ),
                    );
                  }),
            ),
          if (movieData.isEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline_sharp),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'No Movies',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
