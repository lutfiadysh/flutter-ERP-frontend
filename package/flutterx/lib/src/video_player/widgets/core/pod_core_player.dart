part of 'package:flutterx/src/video_player/pod_player.dart';

class _PodCoreVideoPlayer extends StatelessWidget {
  final VideoPlayerController videoPlayerCtr;
  final double videoAspectRatio;
  final String tag;
  final Color controllIconsColor;
  final Color durationTextColor;
    final Color nextIconColor;
  final Color prevIconColor;
  final void Function()? nextVideoTap;
  final void Function()? prevVideoTap;

  const _PodCoreVideoPlayer({
    Key? key,
    required this.videoPlayerCtr,
    required this.videoAspectRatio,
    required this.tag,
    required this.controllIconsColor,
    required this.durationTextColor,
    required this.nextVideoTap,
    required this.prevVideoTap, required this.nextIconColor, required this.prevIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    return Builder(
      builder: (ctrx) {
        return RawKeyboardListener(
          autofocus: true,
          focusNode:
              (podCtr.isFullScreen ? FocusNode() : podCtr.keyboardFocusWeb) ??
                  FocusNode(),
          onKey: (value) => podCtr.onKeyBoardEvents(
            event: value,
            appContext: ctrx,
            tag: tag,
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: videoAspectRatio,
                  child: VideoPlayer(videoPlayerCtr),
                ),
              ),
              GetBuilder<PodGetXVideoController>(
                tag: tag,
                id: 'podVideoState',
                builder: (_) => GetBuilder<PodGetXVideoController>(
                  tag: tag,
                  id: 'video-progress',
                  builder: (podCtr) {
                    if (podCtr.videoThumbnail == null) {
                      return const SizedBox();
                    }

                    if (podCtr.podVideoState == PodVideoState.paused &&
                        podCtr.videoPosition == Duration.zero) {
                      return SizedBox.expand(
                        child: TweenAnimationBuilder<double>(
                          builder: (context, value, child) => Opacity(
                            opacity: value,
                            child: child,
                          ),
                          tween: Tween<double>(begin: 0.7, end: 1),
                          duration: const Duration(milliseconds: 400),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              image: podCtr.videoThumbnail,
                            ),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              _VideoOverlays(
                tag: tag,
                controllIconsColor: controllIconsColor,
                durationTextColor: durationTextColor,
                nextVideoTap: nextVideoTap,
                prevVideoTap: prevVideoTap,
                nextIconColor: nextIconColor,
                prevIconColor: prevIconColor,
              ),
              IgnorePointer(
                child: GetBuilder<PodGetXVideoController>(
                  tag: tag,
                  id: 'podVideoState',
                  builder: (podCtr) {
                    final loadingWidget = podCtr.onLoading?.call(context) ??
                        Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                            color: controllIconsColor,
                            strokeWidth: 2,
                          ),
                        );

                    if (kIsWeb) {
                      switch (podCtr.podVideoState) {
                        case PodVideoState.loading:
                          return loadingWidget;
                        case PodVideoState.paused:
                          return Center(
                            child: Icon(
                              Icons.play_arrow,
                              size: 45,
                              color: controllIconsColor,
                            ),
                          );
                        case PodVideoState.playing:
                          return Center(
                            child: TweenAnimationBuilder<double>(
                              builder: (context, value, child) => Opacity(
                                opacity: value,
                                child: child,
                              ),
                              tween: Tween<double>(begin: 1, end: 0),
                              duration: const Duration(seconds: 1),
                              child: Icon(
                                Icons.pause,
                                size: 45,
                                color: controllIconsColor,
                              ),
                            ),
                          );
                        case PodVideoState.error:
                          return const SizedBox();
                      }
                    } else {
                      if (podCtr.podVideoState == PodVideoState.loading) {
                        return loadingWidget;
                      }
                      return const SizedBox();
                    }
                  },
                ),
              ),
              if (!kIsWeb)
                GetBuilder<PodGetXVideoController>(
                  tag: tag,
                  id: 'full-screen',
                  builder: (podCtr) => podCtr.isFullScreen
                      ? const SizedBox()
                      : GetBuilder<PodGetXVideoController>(
                          tag: tag,
                          id: 'overlay',
                          builder: (podCtr) => podCtr.isOverlayVisible ||
                                  !podCtr.alwaysShowProgressBar
                              ? const SizedBox()
                              : Align(
                                  alignment: Alignment.bottomCenter,
                                  child: PodProgressBar(
                                    tag: tag,
                                    alignment: Alignment.bottomCenter,
                                    podProgressBarConfig:
                                        podCtr.podProgressBarConfig,
                                  ),
                                ),
                        ),
                ),
            ],
          ),
        );
      },
    );
  }
}
