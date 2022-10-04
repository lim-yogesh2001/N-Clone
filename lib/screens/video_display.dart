import 'package:flutter/material.dart';
import '../providers/movies.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../models/episode.dart';

class VideoDisplayScreen extends StatefulWidget {
  final Episode episode;
  VideoDisplayScreen({required this.episode, Key? key}) : super(key: key);

  @override
  State<VideoDisplayScreen> createState() => _VideoDisplayScreenState();
}

class _VideoDisplayScreenState extends State<VideoDisplayScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    // TODO: implement initState
    _controller = VideoPlayerController.network(
      widget.episode.url,
      // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'
    );
    _initializeVideoPlayerFuture =
        _controller.initialize().then((value) => _controller.play());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final movieData = Provider.of<MovieProvider>(context, listen: false)
        .findMovieById(widget.episode.movieId);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                        
                        Positioned(
                          top: 80,
                          left: width * .4,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  _controller.play();
                                }
                              });
                            },
                            icon: Icon(_controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: width * .6,
                          child: IconButton(
                            onPressed: () {
                              print('wow');
                              setState(() {
                                _controller.setPlaybackSpeed(5.0);
                              });
                            },
                            icon: const Icon(Icons.skip_next),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: width * .2,
                          child: IconButton(
                            onPressed: () {
                            },
                            icon: const Icon(Icons.skip_previous_rounded),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: width * .09,
                          child: SizedBox(
                            width: width * 0.8,
                            height: 10,
                            child: VideoProgressIndicator(
                              _controller,
                              colors: const VideoProgressColors(
                                  playedColor: Colors.red,
                                  // bufferedColor: Colors.brown,
                                  backgroundColor: Colors.grey),
                              allowScrubbing: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            movieData.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Episode: ${widget.episode.name}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Length: ${widget.episode.length}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                            const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Description:  ${movieData.description}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text('Main Casts', style: Theme.of(context).textTheme.bodyLarge,)
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              }
            }),
      ),
    );
  }
}
