part of 'package:flutterx/src/video_player/pod_player.dart';

class _MobileOverlay extends StatelessWidget {
  final String tag;
  final Color controllIconsColor;
  final Color durationTextColor;

  const _MobileOverlay({
    Key? key,
    required this.tag,
    required this.controllIconsColor,
    required this.durationTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const overlayColor = Colors.black38;

    final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: _VideoGestureDetector(
                tag: tag,
                onDoubleTap:
                    _isRtl() ? podCtr.onRightDoubleTap : podCtr.onLeftDoubleTap,
                child: ColoredBox(
                  color: overlayColor,
                  child: _LeftRightDoubleTapBox(
                    tag: tag,
                    isLeft: !_isRtl(),
                  ),
                ),
              ),
            ),
            _VideoGestureDetector(
              tag: tag,
              child: ColoredBox(
                color: overlayColor,
                child: SizedBox(
                  height: double.infinity,
                  child: Center(
                    child: _AnimatedPlayPauseIcon(
                        tag: tag,
                        size: 42,
                        controllIconsColor: controllIconsColor),
                  ),
                ),
              ),
            ),
            Expanded(
              child: _VideoGestureDetector(
                tag: tag,
                onDoubleTap:
                    _isRtl() ? podCtr.onLeftDoubleTap : podCtr.onRightDoubleTap,
                child: ColoredBox(
                  color: overlayColor,
                  child: _LeftRightDoubleTapBox(
                    tag: tag,
                    isLeft: _isRtl(),
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: IgnorePointer(
                  child: podCtr.videoTitle ?? const SizedBox(),
                ),
              ),
              MaterialIconButton(
                toolTipMesg: podCtr.podPlayerLabels.settings,
                color: controllIconsColor,
                onPressed: () {
                  if (podCtr.isOverlayVisible) {
                    _bottomSheet(context);
                  } else {
                    podCtr.toggleVideoOverlay();
                  }
                },
                child: const Icon(
                  Icons.more_vert_rounded,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: _MobileOverlayBottomControlles(
              tag: tag,
              controllIconsColor: controllIconsColor,
              durationTextColor: durationTextColor),
        ),
      ],
    );
  }

  bool _isRtl() {
    final Locale locale = window.locale;
    final langs = [
      'ar', // Arabic
      'fa', // Farsi
      'he', // Hebrew
      'ps', // Pashto
      'ur', // Urdu
    ];
    for (int i = 0; i < langs.length; i++) {
      final lang = langs[i];
      if (locale.toString().contains(lang)) {
        return true;
      }
    }
    return false;
  }

  void _bottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _MobileBottomSheet(tag: tag),
    );
  }
}

class _LeftRightDoubleTapBox extends StatelessWidget {
  final String tag;
  final bool isLeft;
  const _LeftRightDoubleTapBox({
    Key? key,
    required this.tag,
    required this.isLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PodGetXVideoController>(
      tag: tag,
      id: 'double-tap',
      builder: (podCtr) {
        return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: podCtr.isLeftDbTapIconVisible && isLeft
                ? 1
                : podCtr.isRightDbTapIconVisible && !isLeft
                    ? 1
                    : 0,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Lottie.asset(
                    isLeft
                        ? 'packages/flutterx/assets/forward_left.json'
                        : 'packages/flutterx/assets/forward_right.json',
                  ),
                  if (isLeft
                      ? podCtr.isLeftDbTapIconVisible
                      : podCtr.isRightDbTapIconVisible)
                    Transform.translate(
                      offset: const Offset(0, 40),
                      child: Text(
                        '${podCtr.isLeftDbTapIconVisible ? podCtr.leftDoubleTapduration : podCtr.rightDubleTapduration} Sec',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
