import 'package:flutter/material.dart';
import 'dart:math' as math;

class BasicLoader extends StatefulWidget {
  final Color color;
  final Duration? duration;
  final double size;
  const BasicLoader({
    Key? key,
    required this.color,
    this.size = 32,
    this.duration,
  }) : super(key: key);

  @override
  State<BasicLoader> createState() => _BasicLoaderState();
}

class _BasicLoaderState extends State<BasicLoader>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duration ??
        const Duration(
          milliseconds: 900,
        ),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: CircularProgressIndicator(
          value: 0.80,
          color: widget.color,
        ),
      ),
    );
  }
}
