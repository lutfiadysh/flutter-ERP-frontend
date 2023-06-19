import 'package:flutter/material.dart';

class FxBadge extends StatelessWidget {
  final Color? color;
  final String text;
  final TextStyle? textStyle;
  final bool isOutlined;
  final double? radius;

  const FxBadge({
    Key? key,
    this.color,
    required this.text,
    this.textStyle,
    this.isOutlined = false,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: isOutlined
            ? Colors.transparent
            : color ?? Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(radius ?? 52.0),
        border: Border.all(color: color ?? Theme.of(context).colorScheme.primary),
      ),
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              fontSize: 13,
              color: isOutlined
                  ? color ?? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onPrimary,
            ),
      ),
    );
  }
}
