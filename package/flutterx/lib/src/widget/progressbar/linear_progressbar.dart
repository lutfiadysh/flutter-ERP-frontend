import 'package:flutter/material.dart';

class FxLinearProgressBar extends StatefulWidget {
  final double value;
  final double width;
  final double? height;
  final Color? backgroundColor;
  final Color? forGroundColor;
  final Color? textColor;
  final double? radius;

  const FxLinearProgressBar({
    Key? key,
    required this.value,
    required this.width,
    this.height,
    this.backgroundColor,
    this.forGroundColor,
    this.textColor,
    this.radius,
  }) : super(key: key);

  @override
  State<FxLinearProgressBar> createState() => _FxLinearProgressBarState();
}

class _FxLinearProgressBarState extends State<FxLinearProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late double _oldPercentage;

  @override
  void initState() {
    _oldPercentage = widget.value;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0);
    final difference = widget.value - _oldPercentage;
    _oldPercentage = widget.value;
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(widget.radius ?? 56)),
          child: Container(
            width: widget.width,
            height: widget.height ?? 15,
            alignment: Alignment.centerLeft,
            color: widget.backgroundColor ?? Colors.grey,
            child: AnimatedContainer(
              alignment: Alignment.center,
              color: widget.forGroundColor ??
                  Theme.of(context).colorScheme.background,
              width: widget.value / 100 * widget.width,
              duration: const Duration(seconds: 1),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  '${((widget.value - difference) + (difference * _controller.value)).toStringAsFixed(0)}%',
                  style: TextStyle(
                    color: widget.textColor ?? Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
