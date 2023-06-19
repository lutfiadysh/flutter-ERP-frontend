import 'package:flutter/widgets.dart';
import 'package:flutterx/src/widget/loader/components/animated_widget.dart';

class RotatingPlainLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration? duration;
  const RotatingPlainLoader({
    Key? key,
    required this.color,
    required this.size,
    this.duration,
  }) : super(key: key);

  @override
  State<RotatingPlainLoader> createState() => _RotatingPlainLoaderState();
}

class _RotatingPlainLoaderState extends State<RotatingPlainLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ??
          const Duration(
            milliseconds: 1500,
          ),
    )
      ..addListener(() => setState(() {}))
      ..repeat();
    _animation1 = Tween(begin: 0.0, end: 180.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.5,
          curve: Curves.easeIn,
        ),
      ),
    );
    _animation2 = Tween(begin: 0.0, end: 180.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.5,
          1.0,
          curve: Curves.easeOut,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(() {});
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..rotateX((0 - _animation1.value) * 0.0174533)
        ..rotateY((0 - _animation2.value) * 0.0174533),
      alignment: FractionalOffset.center,
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: AnimatedPartWidget(
          color: widget.color,
        ),
      ),
    );
  }
}
