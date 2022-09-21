import 'package:flutter/material.dart';
import './providers/episode.dart';
import 'package:netflix_clone/screens/movie_details.dart';
import './screens/dashboard.dart';
import 'package:provider/provider.dart';
import './providers/movie.dart';
import './constants/theme.dart';
import './providers/my_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => EpisodeProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => MyListProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeClass.lightTheme,
        darkTheme: ThemeClass.darkTheme,
        themeMode: ThemeMode.dark,
        home: const DashboardScreen(),
        routes: {MovieDetails.routeName: (context) => const MovieDetails()},
      ),
    );
  }
}
