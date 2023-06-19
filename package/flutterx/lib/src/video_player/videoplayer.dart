import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/src/video_player/controllers/pod_player_controller.dart';
import 'package:flutterx/src/video_player/models/play_video_from.dart';
import 'package:flutterx/src/video_player/models/pod_player_config.dart';
import 'package:flutterx/src/video_player/models/pod_player_labels.dart';
import 'package:flutterx/src/video_player/models/pod_progress_bar_config.dart';
import 'package:flutterx/src/video_player/pod_player.dart';

enum VideoFrom { network, asset, file }

class FxVideoPlayer extends StatefulWidget {
  final VideoFrom videoFrom;
  final List<String> videoList;
  final int initialVideoIndex;
  final double? videoAspectRatio;
  final double progressBarHeight;
  final double barCircleRadius;
  final Color? barCircleColor;
  final Color bufferedBarColor;
  final Color? playingBarColor;
  final Color barBackgroundColor;
  final Color backgroundColor;
  final Color controllIconsColor;
  final Color durationTextColor;
  final Color nextIconColor;
  final Color prevIconColor;

  FxVideoPlayer({
    Key? key,
    required this.videoFrom,
    required this.videoList,
    this.initialVideoIndex = 0,
    this.videoAspectRatio,
    this.progressBarHeight = 3.5,
    this.barCircleRadius = 8,
    this.barCircleColor,
    this.bufferedBarColor = const Color.fromRGBO(255, 255, 255, 0.38),
    this.playingBarColor,
    this.barBackgroundColor = Colors.blueGrey,
    this.backgroundColor = Colors.transparent,
    this.controllIconsColor = Colors.white,
    this.durationTextColor = Colors.white,
    this.nextIconColor = Colors.white,
    this.prevIconColor = Colors.white,
  })  : assert((videoList.isNotEmpty), 'videoList cant\'t be Empty'),
        assert((videoList[0].isNotEmpty), 'check First\'s link of List'),
        assert(!(initialVideoIndex > videoList.length),
            'provide Index within VideoList'),
        super(key: key);

  @override
  State<FxVideoPlayer> createState() => _FxVideoPlayerState();
}

class _FxVideoPlayerState extends State<FxVideoPlayer> {
  late PodPlayerController podController;

  String errorMessage = '';

  int getIndex() {
    return widget.videoList.indexOf(podController.videoUrl ?? '');
  }

  bool getBoolForNextPrev({required bool isNext}) {
    if (isNext) {
      if (widget.videoList.indexOf(podController.videoUrl ?? '') <
          widget.videoList.length - 2) {
        return true;
      } else {
        return false;
      }
    } else {
      if (widget.videoList.indexOf(podController.videoUrl ?? '') > 0) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<void> changeVideo({required bool forward}) async {
    if (getIndex() >= 0) {
      podController.pause();
      try {
        await podController.changeVideo(
            playVideoFrom: PlayVideoFrom.network(
                widget.videoList[forward ? getIndex() + 1 : getIndex() - 1]));
        if (!mounted) return;
        setState(() {});
      } catch (e) {
        errorMessage = e.toString();
      }
    }
  }

  PlayVideoFrom getPlayVideoFrom(String path) {
    if (widget.videoFrom == VideoFrom.network) {
      return PlayVideoFrom.network(
        widget.videoList[widget.initialVideoIndex],
      );
    } else if (widget.videoFrom == VideoFrom.asset) {
      return PlayVideoFrom.asset(
        widget.videoList[widget.initialVideoIndex],
      );
    } else if (widget.videoFrom == VideoFrom.file) {
      return PlayVideoFrom.file(
        widget.videoList[widget.initialVideoIndex],
      );
    } else {
      return PlayVideoFrom.network(
        widget.videoList[widget.initialVideoIndex],
      );
    }
  }

  void checkState() {
    podController.pause();
    if (widget.initialVideoIndex > 0) {
      setState(() {});
    }
  }

  @override
  void initState() {
    podController = PodPlayerController(
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: true,
        isLooping: false,
        videoQualityPriority: [720, 360],
      ),
      playVideoFrom: getPlayVideoFrom(widget.videoList[0]),
    )..initialise().then((value) => checkState());
    super.initState();
  }

  @override
  void dispose() {
    podController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PodVideoPlayer(
          controller: podController,
          controllIconsColor: widget.controllIconsColor,
          durationTextColor: widget.durationTextColor,
          nextIconColor: getBoolForNextPrev(isNext: true)
              ? widget.nextIconColor
              : widget.nextIconColor.withOpacity(0.4),
          prevIconColor: getBoolForNextPrev(isNext: false)
              ? widget.nextIconColor
              : widget.nextIconColor.withOpacity(0.4),
          nextVideoTap: () {
            if (getBoolForNextPrev(isNext: true)) {
              changeVideo(forward: true);
            }
          },
          prevVideoTap: () {
            if (getBoolForNextPrev(isNext: false)) {
              changeVideo(forward: false);
            }
          },
          videoAspectRatio: widget.videoAspectRatio ?? (16 / 9),
          matchFrameAspectRatioToVideo: true,
          matchVideoAspectRatioToFrame: true,
          podPlayerLabels: const PodPlayerLabels(
            play: "PLAY",
            pause: "PAUSE",
            error: "ERROR WHILE TRYING TO PLAY VIDEO",
            exitFullScreen: "EXIT FULL SCREEN",
            fullscreen: "FULL SCREEN",
            loopVideo: "LOOP VIDEO",
            mute: "MUTE",
            playbackSpeed: "PLAYBACK SPEED",
            settings: "SETTINGS",
            unmute: "UNMUTE",
            optionEnabled: "YES",
            optionDisabled: "NO",
            quality: "QUALITY",
          ),
          onVideoError: () {
            return Center(
              child: Container(
                width: 200,
                height: 250,
                color: Colors.black,
                padding: const EdgeInsets.all(15),
                child: Text('Please check URL OR Path :::: $errorMessage',
                    style: const TextStyle(color: Colors.white, fontSize: 19)),
              ),
            );
          },
          backgroundColor: widget.backgroundColor,
          podProgressBarConfig: PodProgressBarConfig(
            padding: kIsWeb ? EdgeInsets.zero : const EdgeInsets.all(8),
            playingBarColor:
                widget.playingBarColor ?? Theme.of(context).colorScheme.primary,
            circleHandlerColor:
                widget.barCircleColor ?? Theme.of(context).colorScheme.primary,
            backgroundColor: widget.barBackgroundColor,
            bufferedBarColor: widget.bufferedBarColor,
            circleHandlerRadius: widget.barCircleRadius,
            curveRadius: 4,
            height: widget.progressBarHeight,
          ),
        ),
      ),
    );
  }
}
