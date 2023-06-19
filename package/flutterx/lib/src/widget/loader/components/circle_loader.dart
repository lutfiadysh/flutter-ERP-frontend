import 'package:flutter/widgets.dart';
import 'package:flutterx/src/widget/loader/components/animated_widget.dart';
import 'package:flutterx/src/widget/loader/delay_tween.dart';

class CircleLoader extends StatefulWidget {
  final Color color;
  final Duration? duration;
  final double size;
  const CircleLoader({
    Key? key,
    required this.color,
    this.size = 50.0,
    this.duration,
  }) : super(key: key);

  @override
  State<CircleLoader> createState() => _CircleLoaderState();
}

class _CircleLoaderState extends State<CircleLoader>
    with SingleTickerProviderStateMixin {
  final List<double> delays = [
    .0,
    -1.1,
    -1.0,
    -0.9,
    -0.8,
    -0.7,
    -0.6,
    -0.5,
    -0.4,
    -0.3,
    -0.2,
    -0.1
  ];
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
    return SizedBox.fromSize(
      size: Size.square(widget.size),
      child: Stack(
        children: List.generate(delays.length, (index) {
          final position = widget.size * 0.5;
          return Positioned.fill(
            left: position,
            top: position,
            child: Transform(
              transform: Matrix4.rotationZ(30.0 * index * 0.0174533),
              child: Align(
                alignment: Alignment.center,
                child: ScaleTransition(
                  scale: DelayTween(
                    begin: 0.0,
                    end: 1.0,
                    delay: delays[index],
                  ).animate(_controller),
                  child: SizedBox.fromSize(
                    size: Size.square(widget.size * 0.15),
                    child: AnimatedPartWidget(
                      color: widget.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
