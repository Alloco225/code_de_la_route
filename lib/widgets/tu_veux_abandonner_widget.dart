import 'package:cdlr/helpers/assets.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TuVeuxAbandonnerWidget extends StatefulWidget {
  final Function() onClose;

  const TuVeuxAbandonnerWidget({super.key, required this.onClose});

  @override
  _TuVeuxAbandonnerWidgetState createState() => _TuVeuxAbandonnerWidgetState();
}

class _TuVeuxAbandonnerWidgetState extends State<TuVeuxAbandonnerWidget> {
  bool isVideoVisible = false;
  bool isVidPlaying = false;
  bool videoPlayedCompletely = false;
  String titleText = 'Quitter ?';
  bool flash = false;
  final List<Map> subtitles = [
    {'text': 'Tu veux abandonner ?', 'startTime': 0.7, 'endTime': 2.7},
    {
      'text': 'Est-ce que tu veux abandonner ?????',
      'startTime': 2.7,
      'endTime': 6.6,
      'flash': true,
    },
    {'text': 'iYaaAAARGHHH !!!!', 'startTime': 6.6, 'endTime': 9.10},
    {'text': 'Tu es pathétique !!', 'startTime': 9.10, 'endTime': 10.11},
    {'text': 'Fuir et fir !!', 'startTime': 10.11, 'endTime': 11.21},
    {'text': 'Fir encore !!', 'startTime': 11.21, 'endTime': 12.41},
    {'text': 'Toujours fir !!', 'startTime': 12.41, 'endTime': 13.61},
    {'text': "Fir et t'enfir !!", 'startTime': 13.61, 'endTime': 14.81},
    {
      'text': "Tu n'as pas le droit d'abandonner",
      'startTime': 14.81,
      'endTime': 20,
      'flash': true,
    },
  ];

  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    final String videoUrl = getMediaPath('/tu_veux_abandonner.mp4');
    print("path ==== $videoUrl");

    _videoPlayerController = VideoPlayerController.asset(videoUrl)
      // VideoPlayerController.networkUrl(Uri.parse(
      //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      // ..addListener(videoListener)
      ..initialize().then((_) {
        print("video initialised");
        setState(() {
          isVideoVisible = true;
        });
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void videoListener() {
    final currentTime =
        _videoPlayerController.value.position.inSeconds.toDouble();

    final Map currentSubtitle = subtitles.firstWhere(
        (subtitle) =>
            currentTime >= subtitle['startTime'] &&
            currentTime <= subtitle['endTime'],
        orElse: () => {});
    setState(() {
      flash = currentSubtitle['flash'] ?? false;
      titleText = currentSubtitle['text'] ?? '';
    });
  }

  Future<void> close() async {
    setState(() {
      isVideoVisible = false;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    _videoPlayerController.pause();
    _videoPlayerController.seekTo(Duration.zero);
    widget.onClose();
  }

  Future<void> giveUp() async {
    try {
      if (isVideoVisible) {
        // Just let the bloke give up nan
        setState(() {
          isVidPlaying = false;
        });
        return;
      }
      setState(() {
        isVideoVisible = true;
      });
      await Future.delayed(const Duration(milliseconds: 500));
      _videoPlayerController.play();
      setState(() {
        isVidPlaying = true;
      });
    } catch (error) {
      print("Can't let you give up");
      setState(() {
        isVidPlaying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _videoPlayerController.value.isPlaying
                ? _videoPlayerController.pause()
                : _videoPlayerController.play();
          });
        },
        child: Icon(
          _videoPlayerController.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: isVideoVisible ? 1.0 : 0.0,
          child: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isVidPlaying = !isVidPlaying;
                    });
                  },
                  child: VideoPlayer(_videoPlayerController),
                  // child: const Placeholder(),
                ),
              ),
              if (!isVidPlaying && !videoPlayedCompletely)
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 500),
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.red.withOpacity(flash ? 0.75 : 0),
                            offset: const Offset(0, 0),
                          ),
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.green.withOpacity(flash ? 0.75 : 0),
                            offset: const Offset(0, 0),
                          ),
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.blue.withOpacity(flash ? 0.75 : 0),
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Text(titleText),
                    ),
                  ),
                ),
              if (videoPlayedCompletely)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100),
                    child: ElevatedButton(
                      onPressed: close,
                      child: const Text('😅 D\'accord chef'),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
