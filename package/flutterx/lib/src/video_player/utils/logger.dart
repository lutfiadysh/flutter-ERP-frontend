import 'dart:developer';

import 'package:flutterx/src/video_player/pod_player.dart';


void podLog(String message) =>
    PodVideoPlayer.enableLogs ? log(message, name: 'POD') : null;
