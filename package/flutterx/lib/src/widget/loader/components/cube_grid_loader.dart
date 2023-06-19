import 'package:flutter/widgets.dart';
import 'package:flutterx/src/widget/loader/components/animated_widget.dart';

class CubeGridLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration? duration;
  const CubeGridLoader({
    Key? key,
    required this.color,
    this.size = 50.0,
    this.duration,
  }) : super(key: key);

  @override
  State<CubeGridLoader> createState() => _CubeGridLoaderState();
}

class _CubeGridLoaderState extends State<CubeGridLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _anim1;
  late Animation<double> _anim2;
  late Animation<double> _anim3;
  late Animation<double> _anim4;
  late Animation<double> _anim5;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ??
          const Duration(
            milliseconds: 1200,
          ),
    )..repeat(reverse: true);
    _anim1 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.1, 0.6, curve: Curves.easeIn)));
    _anim2 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.7, curve: Curves.easeIn)));
    _anim3 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeIn)));
    _anim4 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.9, curve: Curves.easeIn)));
    _anim5 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn)));
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _square(_anim3, 0),
              _square(_anim4, 1),
              _square(_anim5, 2),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _square(_anim2, 3),
              _square(_anim3, 4),
              _square(_anim4, 5),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _square(_anim1, 6),
              _square(_anim2, 7),
              _square(_anim3, 8),
            ],
          ),
        ],
      ),
    );
  }

  Widget _square(Animation<double> animation, int index) {
    return ScaleTransition(
      scale: animation,
      child: SizedBox.fromSize(
        size: Size.square(widget.size / 3),
        child: AnimatedPartWidget(
          color: widget.color,
        ),
      ),
    );
  }
}
