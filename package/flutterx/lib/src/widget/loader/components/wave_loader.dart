import 'package:flutter/material.dart';
import 'package:flutterx/src/constant/enum.dart';
import 'package:flutterx/src/widget/loader/components/animated_widget.dart';
import 'package:flutterx/src/widget/loader/delay_tween.dart';

class WaveLoader extends StatefulWidget {
  final Color color;
  final int itemCount;
  final double size;
  final WaveType type;
  final Duration? duration;
  const WaveLoader({
    Key? key,
    required this.color,
    required this.itemCount,
    required this.size,
    this.type = WaveType.start,
    this.duration,
  })  : assert(itemCount >= 2, 'itemCount Cant be less then 2 '),
        super(key: key);

  @override
  State<WaveLoader> createState() => _WaveLoaderState();
}

class _WaveLoaderState extends State<WaveLoader> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ??
          const Duration(
            milliseconds: 1200,
          ),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<double> bars = getAnimationDelay(widget.itemCount);
    return SizedBox.fromSize(
      size: Size(widget.size * 1.25, widget.size),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(bars.length, (i) {
          return ScaleYWidget(
            scaleY: DelayTween(begin: 0.4, end: 1.0, delay: bars[i])
                .animate(_controller),
            child: SizedBox.fromSize(
                size: Size(widget.size / widget.itemCount, widget.size),
                child: AnimatedPartWidget(
                  color: widget.color,
                )),
          );
        }),
      ),
    );
  }

  List<double> getAnimationDelay(int itemCount) {
    switch (widget.type) {
      case WaveType.start:
        return _startAnimationDelay(itemCount);
      case WaveType.end:
        return _endAnimationDelay(itemCount);
      case WaveType.center:
      default:
        return _centerAnimationDelay(itemCount);
    }
  }

  List<double> _startAnimationDelay(int count) {
    return <double>[
      ...List<double>.generate(
          count ~/ 2, (index) => -1.0 - (index * 0.1) - 0.1).reversed,
      if (count.isOdd) -1.0,
      ...List<double>.generate(
        count ~/ 2,
        (index) => -1.0 + (index * 0.1) + (count.isOdd ? 0.1 : 0.0),
      ),
    ];
  }

  List<double> _endAnimationDelay(int count) {
    return <double>[
      ...List<double>.generate(
          count ~/ 2, (index) => -1.0 + (index * 0.1) + 0.1).reversed,
      if (count.isOdd) -1.0,
      ...List<double>.generate(
        count ~/ 2,
        (index) => -1.0 - (index * 0.1) - (count.isOdd ? 0.1 : 0.0),
      ),
    ];
  }

  List<double> _centerAnimationDelay(int count) {
    return <double>[
      ...List<double>.generate(
          count ~/ 2, (index) => -1.0 + (index * 0.2) + 0.2).reversed,
      if (count.isOdd) -1.0,
      ...List<double>.generate(
          count ~/ 2, (index) => -1.0 + (index * 0.2) + 0.2),
    ];
  }
}

class ScaleYWidget extends AnimatedWidget {
  const ScaleYWidget({
    Key? key,
    required Animation<double> scaleY,
    required this.child,
    this.alignment = Alignment.center,
  }) : super(key: key, listenable: scaleY);

  final Widget child;
  final Alignment alignment;

  Animation<double> get scale => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()..scale(1.0, scale.value, 1.0),
      alignment: alignment,
      child: child,
    );
  }
}
