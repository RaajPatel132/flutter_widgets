import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Player Demo',
      home: VideoPlayerScreen(),
      theme: ThemeData.dark(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>
    with TickerProviderStateMixin {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  bool isOptionVisible;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/test.mp4');
    isOptionVisible = true;
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isOptionVisible = !isOptionVisible;
                      });
                    },
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // aspectRatio: 18/9,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isOptionVisible = !isOptionVisible;
                          });
                        },
                        onDoubleTap: () {
                          setState(() async {
                            // If the video is playing, pause it.
                            Duration nd = await _controller.position;
                            nd = new Duration(seconds: (nd.inSeconds - 10));
                            _controller.seekTo(nd);
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isOptionVisible = !isOptionVisible;
                          });
                        },
                        onDoubleTap: () {
                          setState(() async {
                            // If the video is playing, pause it.
                            Duration nd = await _controller.position;
                            nd = new Duration(seconds: (nd.inSeconds + 10));
                            _controller.seekTo(nd);
                          });
                        },
                      ),
                    )
                  ],
                ),
                AnimatedOpacity(
                  opacity: isOptionVisible ? 1 : 0,
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 200),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isOptionVisible = !isOptionVisible;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  setState(() async {
                                    // If the video is playing, pause it.
                                    Duration nd = await _controller.position;
                                    nd = new Duration(
                                        seconds: (nd.inSeconds - 10));
                                    _controller.seekTo(nd);
                                  });
                                },
                                iconSize: 50,
                                icon: Icon(Icons.fast_rewind_outlined),
                              ),
                              SizedBox(width: 50),
                              IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  setState(() {
                                    // If the video is playing, pause it.
                                    if (_controller.value.isPlaying) {
                                      _controller.pause();
                                      _animationController.reverse();
                                    } else {
                                      // If the video is paused, play it.
                                      _controller.play();
                                      _animationController.forward();
                                    }
                                  });
                                },
                                iconSize: 50,
                                icon: AnimatedIcon(
                                  icon: AnimatedIcons.play_pause,
                                  progress: _animationController,
                                ),
                              ),
                              SizedBox(width: 50),
                              IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  setState(() async {
                                    // If the video is playing, pause it.
                                    Duration nd = await _controller.position;
                                    nd = new Duration(
                                        seconds: (nd.inSeconds + 10));
                                    _controller.seekTo(nd);
                                  });
                                },
                                iconSize: 50,
                                icon: Icon(Icons.fast_forward_outlined),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Wrap the play or pause in a call to `setState`. This ensures the
      //     // correct icon is shown.
      //     setState(() {
      //       // If the video is playing, pause it.
      //       if (_controller.value.isPlaying) {
      //         _controller.pause();
      //       } else {
      //         // If the video is paused, play it.
      //         _controller.play();
      //       }
      //     });
      //   },
      //   // Display the correct icon depending on the state of the player.
      //   child: Icon(
      //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
