part of 'package:flutterx/src/video_player/pod_player.dart';

class _VideoOverlays extends StatelessWidget {
  final String tag;
  final Color controllIconsColor;
  final Color durationTextColor;
    final Color nextIconColor;
  final Color prevIconColor;
  final void Function()? nextVideoTap;
  final void Function()? prevVideoTap;

  const _VideoOverlays({
    Key? key,
    required this.tag,
    required this.controllIconsColor,
    required this.durationTextColor,
    required this.nextVideoTap,
    required this.prevVideoTap, required this.nextIconColor, required this.prevIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    if (podCtr.overlayBuilder != null) {
      return GetBuilder<PodGetXVideoController>(
        id: 'update-all',
        tag: tag,
        builder: (podCtr) {
          ///Custom overlay
          final progressBar = PodProgressBar(
            tag: tag,
            podProgressBarConfig: podCtr.podProgressBarConfig,
          );
          final overlayOptions = OverLayOptions(
              podVideoState: podCtr.podVideoState,
              videoDuration: podCtr.videoDuration,
              videoPosition: podCtr.videoPosition,
              isFullScreen: podCtr.isFullScreen,
              isLooping: podCtr.isLooping,
              isOverlayVisible: podCtr.isOverlayVisible,
              isMute: podCtr.isMute,
              autoPlay: podCtr.autoPlay,
              currentVideoPlaybackSpeed: podCtr.currentPaybackSpeed,
              videoPlayBackSpeeds: podCtr.videoPlaybackSpeeds,
              videoPlayerType: podCtr.videoPlayerType,
              podProgresssBar: progressBar,
              controllIconsColor: controllIconsColor,
              durationTextColor: durationTextColor);

          /// Returns the custom overlay, otherwise returns the default
          /// overlay with gesture detector
          return podCtr.overlayBuilder!(overlayOptions);
        },
      );
    } else {
      ///Built in overlay
      return GetBuilder<PodGetXVideoController>(
        tag: tag,
        id: 'overlay',
        builder: (podCtr) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: podCtr.isOverlayVisible ? 1 : 0,
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                if (!kIsWeb)
                  _MobileOverlay(
                      tag: tag,
                      controllIconsColor: controllIconsColor,
                      durationTextColor: durationTextColor),
                if (kIsWeb)
                  _WebOverlay(
                    tag: tag,
                    controllIconsColor: controllIconsColor,
                    durationTextColor: durationTextColor,
                    nextVideoTap: nextVideoTap,
                    prevVideoTap: prevVideoTap,
                    nextIconColor: nextIconColor,
                    prevIconColor: prevIconColor,
                  ),
              ],
            ),
          );
        },
      );
    }
  }
}
