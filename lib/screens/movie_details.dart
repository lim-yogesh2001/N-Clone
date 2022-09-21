import 'dart:ui';
import "package:flutter/material.dart";
import 'package:netflix_clone/providers/movie.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../widgets/movie_details.dart';
import '../widgets/episodes.dart';

class MovieDetails extends StatefulWidget {
  static const routeName = 'movie-details';
  const MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context)!.settings.arguments as String;
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    final movieDetails = movieProvider.findMovieById(movieId);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height * .55,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(movieDetails.imageUrl),
                        fit: BoxFit.cover)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 10.0,
                    sigmaY: 12.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 33, 33, 33)
                          .withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * .3,
                bottom: 90,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(17.0),
                  child: SizedBox(
                    width: 140,
                    height: 180,
                    child: Card(
                      elevation: 6,
                      child: Image.network(
                        movieDetails.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 245,
                left: 120,
                child: Text(
                  DateFormat.y().format(movieDetails.releaseDate),
                  style: const TextStyle(color: Colors.white70, fontSize: 14.0),
                ),
              ),
              Positioned(
                top: 245,
                left: 160,
                child: Text(
                  movieDetails.season,
                  style: const TextStyle(color: Colors.white70, fontSize: 14.0),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 10,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .95,
                  child: MaterialButton(
                    height: 30.0,
                    onPressed: () {},
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.play_arrow,
                          color: Colors.white70,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text("Play",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 30,
                right: 10,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(25.0)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close_rounded),
                      iconSize: 20.0,
                    )),
              )
            ]),
            Details(
              movieDetails: movieDetails,
              rateFunction: () =>
                  Provider.of<MovieProvider>(context).toggleRate(),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Divider(
              color: Colors.grey,
            ),
            ShowEpisodes(movieId: movieId, tabController: _tabController)
          ],
        ),
      ),
    );
  }
}
