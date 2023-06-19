// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterx/src/constant/color.dart';

/// FxCircularProgress Class
/// [percentage] from 0 to 100 percentage circle
/// [color] percentage line color
/// [backColor] back circle color
/// [showPercentage] show percentage text
/// [gradient] show gradient instead of color
/// [textStyle] text percentage style
/// [stroke] stroke size
/// [round] round stroke
/// [padding] circle padding
class FxCircularProgress extends StatefulWidget {
  final double? width;
  final double? height;
  final double percentage;
  final Color? color;
  final Color? backColor;
  final bool? showPercentage;
  final TextStyle? textStyle;
  final double? stroke;
  final bool? round;

  const FxCircularProgress({
    Key? key,
    required this.percentage,
    this.color,
    this.backColor,
    this.showPercentage,
    this.stroke,
    this.round,
    this.textStyle,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _FxCircularProgressState createState() => _FxCircularProgressState();
}

class _FxCircularProgressState extends State<FxCircularProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double oldPercentage;

  @override
  void initState() {
    oldPercentage = widget.percentage;
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0);
    final difference = widget.percentage - oldPercentage;
    oldPercentage = widget.percentage;
    return SizedBox(
      width: widget.width ?? 100,
      height: widget.height ?? 100,
      child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            final textSpan = TextSpan(
              text:
                  '${((widget.percentage - difference) + (difference * controller.value)).round()}%',
              style: widget.textStyle ??
                  TextStyle(color: FxColor.dark, fontSize: 13),
            );
            return Stack(
              fit: StackFit.expand,
              children: [
                CustomPaint(
                  painter: _Circle(
                    percentage: (widget.percentage - difference) +
                        (difference * controller.value),
                    color: widget.color ??
                        Theme.of(context).colorScheme.background,
                    backColor: widget.backColor ??
                        Theme.of(context).colorScheme.secondary,
                    text: (widget.showPercentage ?? true)
                        ? textSpan
                        : const TextSpan(text: ''),
                    stroke: widget.stroke ?? 5,
                    round: widget.round ?? true,
                  ),
                ),
              ],
            );
          }),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _Circle extends CustomPainter {
  final double percentage;
  final Color color;
  final Color backColor;
  final TextSpan? text;
  final double? stroke;
  final bool round;

  _Circle({
    required this.percentage,
    required this.color,
    required this.backColor,
    this.text,
    this.stroke,
    this.round = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke!
      ..color = backColor;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    final paintProgress = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = round ? StrokeCap.round : StrokeCap.butt
      ..strokeWidth = stroke!;

    paintProgress.color = color;

    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintProgress);

    final textPainter = TextPainter(
        textAlign: TextAlign.center,
        text: text,
        textDirection: TextDirection.ltr)
      ..layout();

    textPainter.paint(
      canvas,
      Offset(
        (size.width - textPainter.width) * 1 / 2,
        (size.height - textPainter.height) * 0.5,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
