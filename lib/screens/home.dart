import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/movie_card.dart';
import '../providers/movies.dart';
import '../screens/mylist.dart';
import './movies_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.15,
              child: Image.asset('assets/images/NetflixLogo.jpeg'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: TabBar(
                  indicatorColor: Colors.black,
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      text: "TV Shows",
                    ),
                    Tab(
                      text: "Movies",
                    ),
                    Tab(
                      text: "My List",
                    ),
                  ]),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, left: 5.0),
          height: MediaQuery.of(context).size.height - 145,
          child: TabBarView(
            controller: _tabController,
            children: const [
              TVShows(),
              MoviesList(),
              MyListScreen(),
            ],
          ),
        )
      ],
    );
  }
}

class TVShows extends StatelessWidget {
  const TVShows({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular on Netflix",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: 170,
            width: double.infinity,
            child: ListView.builder(
                itemCount: movieProvider.getPopularMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return MovieCard(
                      id: movieProvider.getPopularMovies[i].id,
                      imageUrl: movieProvider.getPopularMovies[i].imageUrl);
                }),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            "Trending Now",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: 170,
            width: double.infinity,
            child: ListView.builder(
                itemCount: movieProvider.getTrendingMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return MovieCard(
                      id: movieProvider.getTrendingMovies[i].id,
                      imageUrl: movieProvider.getTrendingMovies[i].imageUrl);
                }),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            "Soon Available",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: 160,
            width: double.infinity,
            child: ListView.builder(
                itemCount: movieProvider.comingSoonShows.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return LargeMovieCard(
                    id: movieProvider.comingSoonShows[i].id,
                    imageUrl: movieProvider.comingSoonShows[i].imageUrl,
                    movieName: movieProvider.comingSoonShows[i].name,
                  );
                }),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            "Watch It Again",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: 170,
            width: double.infinity,
            child: ListView.builder(
                itemCount: movieProvider.tvShows.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return MovieCard(
                      id: movieProvider.tvShows[i].id,
                      imageUrl: movieProvider.tvShows[i].imageUrl);
                }),
          ),
        ],
      ),
    );
  }
}
