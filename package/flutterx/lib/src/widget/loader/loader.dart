import 'package:flutter/material.dart';
import 'package:flutterx/src/constant/enum.dart';
import 'package:flutterx/src/widget/loader/components/basic_loader.dart';
import 'package:flutterx/src/widget/loader/components/circle_loader.dart';
import 'package:flutterx/src/widget/loader/components/cube_grid_loader.dart';
import 'package:flutterx/src/widget/loader/components/double_bounce_loader.dart';
import 'package:flutterx/src/widget/loader/components/fading_circle_loader.dart';
import 'package:flutterx/src/widget/loader/components/pulse_circle_loader.dart';
import 'package:flutterx/src/widget/loader/components/rotating_circle_loader.dart';
import 'package:flutterx/src/widget/loader/components/rotating_plain_loader.dart';
import 'package:flutterx/src/widget/loader/components/spining_lines_loader.dart';
import 'package:flutterx/src/widget/loader/components/wave_loader.dart';

class FxLoader extends StatelessWidget {
  final Duration? duration;
  final LoaderType loaderType;
  final Color color;
  final double size;
  final double lineWidth;
  final int itemCount;
  final WaveType wavetype;
  const FxLoader({
    Key? key,
    required this.loaderType,
    required this.color,
    required this.size,
    this.lineWidth = 2.0,
    this.itemCount = 5,
    this.wavetype = WaveType.start,
    this.duration,
  }) : super(key: key);

  const FxLoader.basicLoader({
    Key? key,
    required this.color,
    required this.size,
    this.duration,
  })  : wavetype = WaveType.start,
        lineWidth = 2.0,
        itemCount = 5,
        loaderType = LoaderType.basicLoader,
        super(key: key);

  const FxLoader.circleLoader({
    Key? key,
    required this.color,
    required this.size,
    this.duration,
  })  : wavetype = WaveType.start,
        lineWidth = 2.0,
        itemCount = 5,
        loaderType = LoaderType.circleLoader,
        super(key: key);

  const FxLoader.cubeGridLoader({
    Key? key,
    required this.color,
    required this.size,
    this.duration,
  })  : wavetype = WaveType.start,
        lineWidth = 2.0,
        itemCount = 5,
        loaderType = LoaderType.cubeGridLoader,
        super(key: key);
  const FxLoader.doubleBounceLoader({
    Key? key,
    required this.color,
    required this.size,
    this.duration,
  })  : wavetype = WaveType.start,
        lineWidth = 2.0,
        itemCount = 5,
        loaderType = LoaderType.doubleBounceLoader,
        super(key: key);

  const FxLoader.fadingCircleLoader({
    Key? key,
    required this.color,
    required this.size,
    this.duration,
  })  : wavetype = WaveType.start,
        lineWidth = 2.0,
        itemCount = 5,
        loaderType = LoaderType.fadingCircleLoader,
        super(key: key);

  const FxLoader.pulseCircleLoader({
    Key? key,
    required this.color,
    required this.size,
    this.duration,
  })  : wavetype = WaveType.start,
        lineWidth = 2.0,
        itemCount = 5,
        loaderType = LoaderType.pulseCircleLoader,
        super(key: key);

  const FxLoader.rotatingCircleLoader({
    Key? key,
    required this.color,
    required this.size,
    this.duration,
  })  : wavetype = WaveType.start,
        lineWidth = 2.0,
        itemCount = 5,
        loaderType = LoaderType.rotatingCircleLoader,
        super(key: key);
  const FxLoader.rotatingPlainLoader({
    Key? key,
    required this.color,
    required this.size,
    this.duration,
  })  : wavetype = WaveType.start,
        lineWidth = 2.0,
        itemCount = 5,
        loaderType = LoaderType.rotatingPlainLoader,
        super(key: key);

  const FxLoader.spinningLinesLoader({
    Key? key,
    required this.color,
    required this.size,
    required this.lineWidth,
    required this.itemCount,
    this.duration,
  })  : wavetype = WaveType.start,
        loaderType = LoaderType.spiningLinesLoader,
        super(key: key);

  const FxLoader.waveLoader({
    Key? key,
    required this.color,
    required this.size,
    required this.itemCount,
    this.wavetype = WaveType.start,
    this.duration,
  })  : assert(itemCount >= 2, 'itemCount Can\'t be less then 2'),
        loaderType = LoaderType.waveLoader,
        lineWidth = 2.0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return getLoader();
  }

  Widget getLoader() {
    if (loaderType == LoaderType.basicLoader) {
      return BasicLoader(
        color: color,
        size: size,
        duration: duration,
      );
    } else if (loaderType == LoaderType.circleLoader) {
      return CircleLoader(
        color: color,
        size: size,
        duration: duration,
      );
    } else if (loaderType == LoaderType.cubeGridLoader) {
      return CubeGridLoader(
        color: color,
        size: size,
        duration: duration,
      );
    } else if (loaderType == LoaderType.doubleBounceLoader) {
      return DoubleBounceLoader(
        color: color,
        size: size,
        duration: duration,
      );
    } else if (loaderType == LoaderType.fadingCircleLoader) {
      return FadingCircleLoader(
        color: color,
        size: size,
        duration: duration,
      );
    } else if (loaderType == LoaderType.pulseCircleLoader) {
      return PulseCircleLoader(
        color: color,
        size: size,
      );
    } else if (loaderType == LoaderType.rotatingCircleLoader) {
      return RotatingCircleLoader(
        color: color,
        size: size,
        duration: duration,
      );
    } else if (loaderType == LoaderType.rotatingPlainLoader) {
      return RotatingPlainLoader(
        color: color,
        size: size,
        duration: duration,
      );
    } else if (loaderType == LoaderType.spiningLinesLoader) {
      return SpinningLinesLoader(
        color: color,
        size: size,
        duration: duration,
        itemCount: itemCount,
        lineWidth: lineWidth,
      );
    } else if (loaderType == LoaderType.waveLoader) {
      return WaveLoader(
        color: color,
        size: size,
        duration: duration,
        itemCount: itemCount,
        type: wavetype,
      );
    } else {
      return BasicLoader(
        color: color,
        duration: duration,
        size: size,
      );
    }
  }
}
