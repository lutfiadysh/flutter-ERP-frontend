import 'dart:ui';

import 'package:flutterx/src/video_player/utils/enums.dart';
import 'package:flutterx/src/video_player/widgets/pod_progress_bar.dart';


class OverLayOptions {
  final PodVideoState podVideoState;
  final Duration videoDuration;
  final Duration videoPosition;
  final bool isFullScreen;
  final bool isLooping;
  final bool isOverlayVisible;
  final bool isMute;
  final bool autoPlay;
  final String currentVideoPlaybackSpeed;
  final List<String> videoPlayBackSpeeds;
  final PodVideoPlayerType videoPlayerType;
  final PodProgressBar podProgresssBar;
  final Color controllIconsColor;
  final Color durationTextColor;
  OverLayOptions({
    required this.podVideoState,
    required this.videoDuration,
    required this.videoPosition,
    required this.isFullScreen,
    required this.isLooping,
    required this.isOverlayVisible,
    required this.isMute,
    required this.autoPlay,
    required this.currentVideoPlaybackSpeed,
    required this.videoPlayBackSpeeds,
    required this.videoPlayerType,
    required this.podProgresssBar,
    required this.controllIconsColor,
    required this.durationTextColor,
  });
}
