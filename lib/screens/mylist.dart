import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/providers/movie.dart';
import 'package:netflix_clone/screens/movie_details.dart';
import 'package:provider/provider.dart';
import '../providers/my_list.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mylistProvider = Provider.of<MyListProvider>(context);
    final mylist = mylistProvider.mylist;
    return ListView.builder(
        itemCount: mylist.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            // onTap: () => Navigator.of(context).pushNamed(MovieDetails.routeName, arguments: ),
            child: Container(
              margin: const EdgeInsets.all(5.0),
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    height: 80,
                    width: 70,
                    child: Image.network(
                      mylist[index].coverImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 40),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              mylist[index].movieName,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            DateFormat.y().format(mylist[index].length),
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text(
                                    "Delete ${mylist[index].movieName}?",
                                    style: TextStyle(
                                        color: Theme.of(context).errorColor,
                                        fontFamily: 'Rubik',
                                        fontSize: 16.0),
                                  ),
                                  content: const Text(
                                    "Please select 'Yes' to delete.",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: 'Rubik',
                                        fontSize: 12.0),
                                  ),
                                  actions: [
                                    MaterialButton(
                                      color: Colors.red,
                                      onPressed: () {
                                        mylistProvider
                                            .removeFromMyList(mylist[index]);
                                        Navigator.of(ctx).pop();
                                      },
                                      child: const Text('Yes'),
                                    ),
                                    MaterialButton(
                                      color: Colors.blue,
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: const Text('No'),
                                    )
                                  ],
                                ));
                        // Scaffold.of(context).showBottomSheet(
                        //   (context) => const SnackBar(
                        //     content: Text("Deleted Successfully"),
                        //   ),
                        // );
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
