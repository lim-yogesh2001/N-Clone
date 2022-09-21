import 'package:flutter/material.dart';
import '../models/episode.dart';

class EpisodeItem extends StatelessWidget {
  final Episode episodeData;
  const EpisodeItem({required this.episodeData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      width: double.infinity,
      child: Row(
        children: [
          Stack(children: [
            SizedBox(
              width: 100,
              height: 75,
              child: Image.network(
                episodeData.coverImage,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 40,
              top: 25,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white60,
                ),
                alignment: Alignment.center,
                child: const Icon(Icons.play_arrow, color: Colors.black,),
              ),
            )
          ]),
          Container(
            width: 175,
            margin: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  episodeData.name,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  episodeData.length,
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
          const Expanded(child: Icon(Icons.download))
        ],
        
      ),
    );
  }
}
