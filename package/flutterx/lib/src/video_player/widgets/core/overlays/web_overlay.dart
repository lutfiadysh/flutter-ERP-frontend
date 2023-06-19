part of 'package:flutterx/src/video_player/pod_player.dart';

class _WebOverlay extends StatelessWidget {
  final String tag;
  final Color durationTextColor;
  final Color controllIconsColor;
  final Color nextIconColor;
  final Color prevIconColor;
  final void Function()? nextVideoTap;
  final void Function()? prevVideoTap;

  const _WebOverlay({
    Key? key,
    required this.tag,
    required this.durationTextColor,
    required this.controllIconsColor,
    required this.nextVideoTap,
    required this.prevVideoTap,
    required this.nextIconColor,
    required this.prevIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const overlayColor = Colors.black38;
    final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    return Stack(
      children: [
        Positioned.fill(
          child: _VideoGestureDetector(
            tag: tag,
            onTap: podCtr.togglePlayPauseVideo,
            onDoubleTap: () => podCtr.toggleFullScreenOnWeb(context, tag),
            child: const ColoredBox(
              color: overlayColor,
              child: SizedBox.expand(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: _WebOverlayBottomControlles(
            tag: tag,
            controllIconsColor: controllIconsColor,
            durationTextColor: durationTextColor,
            nextVideoTap: nextVideoTap,
            prevVideoTap: prevVideoTap,
            nextIconColor: nextIconColor,
            prevIconColor: prevIconColor,
          ),
        ),
        Positioned.fill(
          child: Row(
            children: [
              Expanded(
                child: IgnorePointer(
                  child: _LeftRightDoubleTapBox(
                    tag: tag,
                    isLeft: true,
                  ),
                ),
              ),
              Expanded(
                child: IgnorePointer(
                  child: _LeftRightDoubleTapBox(
                    tag: tag,
                    isLeft: false,
                  ),
                ),
              ),
            ],
          ),
        ),
        IgnorePointer(child: podCtr.videoTitle ?? const SizedBox()),
      ],
    );
  }
}

class _WebOverlayBottomControlles extends StatelessWidget {
  final String tag;
  final Color durationTextColor;
  final Color controllIconsColor;
  final Color nextIconColor;
  final Color prevIconColor;
  final void Function()? nextVideoTap;
  final void Function()? prevVideoTap;
  const _WebOverlayBottomControlles({
    Key? key,
    required this.tag,
    required this.durationTextColor,
    required this.controllIconsColor,
    required this.nextIconColor,
    required this.prevIconColor,
    required this.nextVideoTap,
    required this.prevVideoTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    TextStyle durationTextStyle = TextStyle(color: durationTextColor);
    // P.R.S
    // const itemColor = Colors.white;
    // P.R.S buttons color
    return MouseRegion(
      onHover: (event) => podCtr.onOverlayHover(),
      onExit: (event) => podCtr.onOverlayHoverExit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PodProgressBar(
              tag: tag,
              podProgressBarConfig: podCtr.podProgressBarConfig,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        MaterialIconButton(
                          color: prevIconColor,
                          toolTipMesg: 'Previous Video',
                          onPressed: prevVideoTap,
                          child: const Icon(
                            Icons.skip_previous,
                          ),
                        ),

                        _AnimatedPlayPauseIcon(
                          tag: tag,
                          controllIconsColor: controllIconsColor,
                        ),
                        MaterialIconButton(
                          color: nextIconColor,
                          toolTipMesg: 'Next Video',
                          onPressed: nextVideoTap,
                          child: const Icon(
                            Icons.skip_next,
                          ),
                        ),

                        // new P.R.S
                        GetBuilder<PodGetXVideoController>(
                          tag: tag,
                          id: 'volume',
                          builder: (podCtr) => MaterialIconButton(
                            toolTipMesg: podCtr.isMute
                                ? podCtr.podPlayerLabels.unmute ??
                                    'Unmute${kIsWeb ? ' (m)' : ''}'
                                : podCtr.podPlayerLabels.mute ??
                                    'Mute${kIsWeb ? ' (m)' : ''}',
                            color: controllIconsColor,
                            onPressed: podCtr.toggleMute,
                            child: Icon(
                              podCtr.isMute
                                  ? Icons.volume_off_rounded
                                  : Icons.volume_up_rounded,
                            ),
                          ),
                        ),
                        GetBuilder<PodGetXVideoController>(
                          tag: tag,
                          id: 'video-progress',
                          builder: (podCtr) {
                            return Row(
                              children: [
                                Text(
                                  podCtr.calculateVideoDuration(
                                    podCtr.videoPosition,
                                  ),
                                  style: durationTextStyle,
                                ),
                                Text(
                                  ' / ',
                                  style: durationTextStyle,
                                ),
                                Text(
                                  podCtr.calculateVideoDuration(
                                    podCtr.videoDuration,
                                  ),
                                  style: durationTextStyle,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        _WebSettingsDropdown(
                            tag: tag, controllIconsColor: controllIconsColor),
                        MaterialIconButton(
                          toolTipMesg: podCtr.isFullScreen
                              ? podCtr.podPlayerLabels.exitFullScreen ??
                                  'Exit full screen${kIsWeb ? ' (f)' : ''}'
                              : podCtr.podPlayerLabels.fullscreen ??
                                  'Fullscreen${kIsWeb ? ' (f)' : ''}',
                          color: controllIconsColor,
                          onPressed: () =>
                              _onFullScreenToggle(podCtr, context),
                          child: Icon(
                            podCtr.isFullScreen
                                ? Icons.fullscreen_exit
                                : Icons.fullscreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onFullScreenToggle(
    PodGetXVideoController podCtr,
    BuildContext context,
  ) {
    if (podCtr.isOverlayVisible) {
      if (podCtr.isFullScreen) {
        if (kIsWeb) {
          html.document.exitFullscreen();
          podCtr.disableFullScreen(context, tag);
          return;
        } else {
          podCtr.disableFullScreen(context, tag);
        }
      } else {
        if (kIsWeb) {
          html.document.documentElement?.requestFullscreen();
          podCtr.enableFullScreen(tag);
          return;
        } else {
          podCtr.enableFullScreen(tag);
        }
      }
    } else {
      podCtr.toggleVideoOverlay();
    }
  }
}
