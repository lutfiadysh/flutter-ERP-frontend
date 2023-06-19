import 'package:flutter/widgets.dart';
import 'package:flutterx/src/widget/loader/components/animated_widget.dart';

class DoubleBounceLoader extends StatefulWidget {
  final Color color;
  final double size;
  final Duration? duration;

  const DoubleBounceLoader({
    Key? key,
    required this.color,
    this.size = 50.0,
    this.duration,
  }) : super(key: key);

  @override
  State<DoubleBounceLoader> createState() => _DoubleBounceLoaderState();
}

class _DoubleBounceLoaderState extends State<DoubleBounceLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ??
          const Duration(
            milliseconds: 2000,
          ),
    )
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);
    _animation = Tween(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
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
    return Stack(
      children: List.generate(2, (i) {
        return Transform.scale(
          scale: (1.0 - i - _animation.value.abs()).abs(),
          child: SizedBox.fromSize(
            size: Size.square(widget.size),
            child: AnimatedPartWidget(
              color: widget.color.withOpacity(0.6),
              shape: BoxShape.circle,
            ),
          ),
        );
      }),
    );
  }
}
