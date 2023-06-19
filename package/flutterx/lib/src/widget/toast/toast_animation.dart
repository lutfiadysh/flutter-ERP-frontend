import 'package:flutter/material.dart';

class ToastAnimation extends StatefulWidget {
  final Widget child;
  final Offset offset;
  final Duration? duration;
  const ToastAnimation({
    Key? key,
    required this.child,
    required this.offset,
    this.duration,
  }) : super(key: key);

  @override
  State<ToastAnimation> createState() => _ToastAnimationState();
}

class _ToastAnimationState extends State<ToastAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 300),
    )..forward();
  }

  @override
  void deactivate() {
    _controller.stop();
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: widget.offset,
        end: const Offset(0.0, 0.0),
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeIn,
          reverseCurve: Curves.easeOut,
        ),
      ),
      child: widget.child,
    );
  }
}
