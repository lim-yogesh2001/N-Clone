import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/video_display.dart';
import '../models/episode.dart';
import 'package:provider/provider.dart';
import '../providers/episode.dart';
import './episode_item.dart';

class ShowEpisodes extends StatelessWidget {
  const ShowEpisodes({
    super.key,
    required this.movieId,
    required TabController tabController,
    required this.episodeList,
    required this.trailer,
  }) : _tabController = tabController;

  final String movieId;
  final TabController _tabController;
  final List<Episode> episodeList;
  final List<Episode> trailer;

  @override
  Widget build(BuildContext context) {
    // final episodeProvider = Provider.of<EpisodeProvider>(context, listen: false);
    // final episodeList = episodeProvider.filteredEpisodes(movieId);
    // final trailer = episodeProvider.trailers(movieId);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .75,
          child: TabBar(
              indicatorColor: Colors.red,
              controller: _tabController,
              tabs: const [
                Tab(
                  text: "Episodes",
                ),
                Tab(
                  text: "Trailer & more",
                )
              ]),
        ),
        SizedBox(
          height: 200,
          child: TabBarView(controller: _tabController, children: [
            ListView.builder(
              itemCount: episodeList.length,
              itemBuilder: (ctx, index) => GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VideoDisplayScreen(episode: episodeList[index]),
                  ),
                ),
                child: EpisodeItem(episodeData: episodeList[index]),
              ),
            ),
            ListView.builder(
              itemCount: trailer.length,
              itemBuilder: (ctx, index) => EpisodeItem(
                episodeData: trailer[index],
              ),
            )
          ]),
        ),
      ],
    );
  }
}
