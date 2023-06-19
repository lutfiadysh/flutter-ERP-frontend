import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final List<String> urls = [
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4'
  ];

  TextStyle textStyle = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  double getWidth({required BuildContext ctx}) {
    if (Responsive.isWeb(ctx)) {
      return ((MediaQuery.of(ctx).size.width - 240) / 2 - 34);
    } else {
      return (MediaQuery.of(ctx).size.width);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      runSpacing: 20,
      spacing: 20,
      children: [
        wrapedWidget(
          ctx: context,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Single Video', style: textStyle),
                  FxBox.h20,
                  IntrinsicHeight(
                    child: FxVideoPlayer(
                      videoFrom: VideoFrom.network,
                      videoList: [urls[0]],
                      videoAspectRatio: 21 / 9,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        wrapedWidget(
          ctx: context,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Multiple Video', style: textStyle),
                  FxBox.h20,
                  IntrinsicHeight(
                    child: FxVideoPlayer(
                      videoFrom: VideoFrom.network,
                      videoList: urls,
                      initialVideoIndex: 0,
                      videoAspectRatio: 1 / 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        FxBox.h16,
      ],
    );
  }

  Widget wrapedWidget({required BuildContext ctx, required Widget child}) {
    return SizedBox(
      width: getWidth(ctx: ctx),
      child: child,
    );
  }
}
