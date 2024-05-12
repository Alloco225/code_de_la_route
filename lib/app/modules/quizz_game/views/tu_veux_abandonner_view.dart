import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../helpers/assets.dart';

class TuVeuxAbandonnerView extends StatefulWidget {
  final Function() onClose;

  const TuVeuxAbandonnerView({super.key, required this.onClose});

  @override
  _TuVeuxAbandonnerViewState createState() => _TuVeuxAbandonnerViewState();
}

class _TuVeuxAbandonnerViewState extends State<TuVeuxAbandonnerView> {
  bool isVideoVisible = false;

  bool hasVideoPlayedCompletely = false;
  String titleText = 'Quitter ?';
  bool flash = false;
  final List<Map> subtitles = [
    {'text': 'Tu veux abandonner ?', 'startTime': 0.1, 'endTime': 2.2},
    {
      'text': 'Est-ce que tu veux abandonner ?????',
      'startTime': 2.5,
      'endTime': 6.6,
      'flash': true,
    },
    {'text': 'iYaaAAARGHHH !!!!', 'startTime': 6.5, 'endTime': 9.0},
    {'text': 'Tu es pathétique !!', 'startTime': 9.0, 'endTime': 10.11},
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
  // TODO add flash blink animation

  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    final String videoUrl = getMediaPath('/tu_veux_abandonner.mp4');
    print("path ==== $videoUrl");

    _videoPlayerController = VideoPlayerController.asset(videoUrl)
      // VideoPlayerController.networkUrl(Uri.parse(
      //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..addListener(videoListener)
      ..initialize().then((_) {
        print("video initialised");
        setState(() {
          isVideoVisible = true;

          _videoPlayerController.play();
          // hasVideoPlayedCompletely = true;
        });
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    widget.onClose();
    super.dispose();
  }

  void videoListener() {
    final currentTime =
        _videoPlayerController.value.position.inMilliseconds.toDouble() / 1000;
    hasVideoPlayedCompletely = false;
    print("currentTime : $currentTime");
    final Map currentSubtitle = subtitles.firstWhere(
        (subtitle) =>
            currentTime >= subtitle['startTime'] &&
            currentTime < subtitle['endTime'],
        orElse: () => {});
    print("currentSubtitle : $currentSubtitle");

    // Implement your calls inside these conditions' bodies :
    if (_videoPlayerController.value.position ==
        const Duration(seconds: 0, minutes: 0, hours: 0)) {
      // isVidPlaying = true;
    }

    if (_videoPlayerController.value.position ==
        _videoPlayerController.value.duration) {
      hasVideoPlayedCompletely = true;
    }

    setState(() {
      flash = currentSubtitle['flash'] ?? false;
      titleText = currentSubtitle['text'] ?? '';
    });
  }

  Future<void> closePage() async {
    setState(() {
      isVideoVisible = false;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    _videoPlayerController.pause();
    _videoPlayerController.seekTo(Duration.zero);
    widget.onClose();
  }

  togglePauseVideo() {
    setState(() {
      _videoPlayerController.value.isPlaying
          ? _videoPlayerController.pause()
          : _videoPlayerController.play();
    });
  }

  onScreenTap() {
    if (hasVideoPlayedCompletely) {
      closePage();
      return;
    }
    togglePauseVideo();
  }

  Future<void> giveUp() async {
    try {
      if (isVideoVisible) {
        // Just let the bloke give up nan
        setState(() {});
        return;
      }
      setState(() {
        isVideoVisible = true;
      });
      await Future.delayed(const Duration(milliseconds: 500));
      _videoPlayerController.play();
      setState(() {});
    } catch (error) {
      print("Can't let you give up");
    }
  }

  bool get isVidPlaying => _videoPlayerController.value.isPlaying;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: isVideoVisible ? 1.0 : 0.0,
          child: Stack(
            children: [
              Positioned.fill(
                child: GestureDetector(
                  onTap: onScreenTap,
                  onLongPress: closePage,
                  child: VideoPlayer(_videoPlayerController),
                  // child: const Placeholder(),
                ),
              ),
              if (isVidPlaying && !hasVideoPlayedCompletely)
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    // child: AnimatedDefaultTextStyle(
                    //   duration: const Duration(milliseconds: 500),
                    //   style: TextStyle(
                    //     fontSize: 64,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.white,
                    //     shadows: [
                    //       Shadow(
                    //         blurRadius: 5.0,
                    //         color: Colors.red.withOpacity(flash ? 0.75 : 0),
                    //         offset: const Offset(0, 0),
                    //       ),
                    //       Shadow(
                    //         blurRadius: 5.0,
                    //         color: Colors.green.withOpacity(flash ? 0.75 : 0),
                    //         offset: const Offset(0, 0),
                    //       ),
                    //       Shadow(
                    //         blurRadius: 5.0,
                    //         color: Colors.blue.withOpacity(flash ? 0.75 : 0),
                    //         offset: const Offset(0, 0),
                    //       ),
                    //     ],
                    //   ),
                    child: Text(
                      flash ? titleText.toUpperCase() : titleText,
                      semanticsLabel: titleText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black,
                            offset: Offset(1, 1),
                          ),
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.black,
                            offset: Offset(-1, -1),
                          ),
                        ],
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    // ),
                  ),
                ),
              if (hasVideoPlayedCompletely)
                Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: closePage,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 100),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text(
                          "😅 D'ACCORD CHEF !",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                          semanticsLabel: "😅 D'ACCORD CHEF",
                        ),
                      ),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
