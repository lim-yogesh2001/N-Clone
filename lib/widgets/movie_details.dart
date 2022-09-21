import "package:flutter/material.dart";
import 'package:netflix_clone/models/my_list.dart';
import "../models/movie.dart";
import '../providers/my_list.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.movieDetails,
    required this.rateFunction,
  });

  final Movie movieDetails;
  final VoidCallback rateFunction;

  @override
  Widget build(BuildContext context) {
    final mylistProvider = Provider.of<MyListProvider>(context, listen: false);
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movieDetails.name,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              movieDetails.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Cast: ${movieDetails.cast}",
              style: const TextStyle(fontSize: 12.0, color: Colors.white70),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              "Creator: ${movieDetails.producer}",
              style: const TextStyle(fontSize: 12.0, color: Colors.white70),
            ),
            Row(
              children: [
                SizedBox(
                  width: 80.0,
                  child: Column(
                    children: [
                      IconButton(
                          splashColor: Colors.white,
                          onPressed: () {
                            mylistProvider.addToMyList(
                              MyList(
                                DateTime.now().toString(),
                                movieDetails.name,
                                movieDetails.imageUrl,
                                movieDetails.releaseDate.toString(),
                                true,
                              ),
                            );
                            // Scaffold.of(context).showBottomSheet(
                            //   (context) => const SnackBar(
                            //     content: Text("Deleted Successfully"),
                            //   ),
                            // );
                          },
                          icon: const Icon(Icons.add)),
                      const Text(
                        "My List",
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 80.0,
                  child: Column(
                    children: [
                      IconButton(
                          splashColor: Colors.white,
                          onPressed: () {
                            rateFunction;
                            },
                          icon: const Icon(Icons.thumb_up)),
                      const Text(
                        "Rate",
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 80.0,
                  child: Column(
                    children: [
                      IconButton(
                          splashColor: Colors.white,
                          onPressed: () {
                          },
                          icon: const Icon(Icons.share)),
                      const Text(
                        "Share",
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
    );
  }
}
