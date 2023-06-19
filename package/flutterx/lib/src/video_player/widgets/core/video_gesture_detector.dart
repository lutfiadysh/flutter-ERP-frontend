part of 'package:flutterx/src/video_player/pod_player.dart';


class _VideoGestureDetector extends StatelessWidget {
  final Widget? child;
  final void Function()? onDoubleTap;
  final void Function()? onTap;
  final String tag;

  const _VideoGestureDetector({
    Key? key,
    this.child,
    this.onDoubleTap,
    this.onTap,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    return MouseRegion(
      onHover: (event) => podCtr.onOverlayHover(),
      onExit: (event) => podCtr.onOverlayHoverExit(),
      child: GestureDetector(
        onTap: onTap ?? podCtr.toggleVideoOverlay,
        onDoubleTap: onDoubleTap,
        child: child,
      ),
    );
  }
}
