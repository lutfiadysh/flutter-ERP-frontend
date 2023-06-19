// ignore_for_file: use_build_context_synchronously

part of 'package:flutterx/src/video_player/pod_player.dart';

class FullScreenView extends StatefulWidget {
  final String tag;
  // final Color controllIconsColor;
  // final Color durationTextColor;
  const FullScreenView({
    Key? key,
    required this.tag,
  }) : super(key: key);

  @override
  State<FullScreenView> createState() => _FullScreenViewState();
}

class _FullScreenViewState extends State<FullScreenView>
    with TickerProviderStateMixin {
  late PodGetXVideoController _podCtr;
  @override
  void initState() {
    _podCtr = Get.find<PodGetXVideoController>(tag: widget.tag);
    _podCtr.fullScreenContext = context;
    _podCtr.keyboardFocusWeb?.removeListener(_podCtr.keyboadListner);

    super.initState();
  }

  @override
  void dispose() {
    _podCtr.keyboardFocusWeb?.requestFocus();
    _podCtr.keyboardFocusWeb?.addListener(_podCtr.keyboadListner);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loadingWidget = _podCtr.onLoading?.call(context) ??
        const CircularProgressIndicator(
          backgroundColor: Colors.black87,
          color: Colors.white,
          strokeWidth: 2,
        );

    return WillPopScope(
      onWillPop: () async {
        if (kIsWeb) {
          await _podCtr.disableFullScreen(
            context,
            widget.tag,
            enablePop: false,
          );
        }
        if (!kIsWeb) await _podCtr.disableFullScreen(context, widget.tag);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GetBuilder<PodGetXVideoController>(
          tag: widget.tag,
          builder: (podCtr) => Center(
            child: ColoredBox(
              color: Colors.black,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: podCtr.videoCtr == null
                      ? loadingWidget
                      : podCtr.videoCtr!.value.isInitialized
                          ? _PodCoreVideoPlayer(
                              tag: widget.tag,
                              videoPlayerCtr: podCtr.videoCtr!,
                              videoAspectRatio:
                                  podCtr.videoCtr?.value.aspectRatio ?? 16 / 9,
                              controllIconsColor: podCtr.controllIconsColor,
                              durationTextColor: podCtr.durationTextColor,
                              nextVideoTap: podCtr.nextVideoTap,
                              prevVideoTap: podCtr.prevVideoTap,
                              nextIconColor: podCtr.nextIconColor,
                              prevIconColor: podCtr.prevIconColor,
                            )
                          : loadingWidget,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
