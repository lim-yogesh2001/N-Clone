import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchItem extends StatelessWidget {
  final String imageUrl;
  final String movieName;
  final DateTime releaseDate;
  const SearchItem({
    required this.movieName,
    required this.imageUrl,
    required this.releaseDate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 70,
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/imgIcon.png'),
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                movieName,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                DateFormat.y().format(releaseDate),
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          )
        ],
      ),
    );
  }
}
