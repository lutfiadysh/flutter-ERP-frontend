import 'package:flutter/material.dart';

abstract class ToastProvider {
  const ToastProvider();
  Widget show(BuildContext context, double? toastWidth);
}

class ToastWithColor extends ToastProvider {
  final String message;
  final Widget? leading;
  final Color? backgroundColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final int maxLines;
  final double radius;
  final double? height;
  final bool isLightBackground;

  const ToastWithColor({
    required this.message,
    this.leading,
    this.textStyle,
    this.maxLines = 2,
    this.backgroundColor,
    this.borderColor,
    this.radius = 12,
    this.height,
    this.isLightBackground = false,
  }) : super();

  const ToastWithColor.success({
    Key? key,
    required this.message,
    this.leading,
    this.textStyle,
    this.maxLines = 2,
    this.backgroundColor = Colors.green,
    this.borderColor,
    this.radius = 12,
    this.height,
    this.isLightBackground = false,
  }) : super();

  const ToastWithColor.error({
    Key? key,
    required this.message,
    this.leading,
    this.textStyle,
    this.maxLines = 2,
    this.backgroundColor = Colors.red,
    this.borderColor,
    this.radius = 12,
    this.height,
    this.isLightBackground = false,
  }) : super();

  const ToastWithColor.warning({
    Key? key,
    required this.message,
    this.leading,
    this.textStyle,
    this.maxLines = 2,
    this.backgroundColor = Colors.amber,
    this.borderColor,
    this.radius = 12,
    this.height,
    this.isLightBackground = false,
  }) : super();

  const ToastWithColor.info({
    Key? key,
    required this.message,
    this.leading,
    this.textStyle,
    this.maxLines = 2,
    this.backgroundColor = Colors.blue,
    this.borderColor,
    this.radius = 12,
    this.height,
    this.isLightBackground = false,
  }) : super();

  @override
  Widget show(BuildContext context, double? toastWidth) {
    bool isWeb = MediaQuery.of(context).size.width >= 1100;
    return Container(
      width: isWeb ? toastWidth ?? 500 : MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      clipBehavior: Clip.hardEdge,
      child: Container(
        height: height,
        padding: const EdgeInsets.all(12.0),
        width:
            isWeb ? toastWidth ?? 500 : MediaQuery.of(context).size.width - 32,
        decoration: BoxDecoration(
          color: isLightBackground
              ? backgroundColor?.withOpacity(0.25) ??
                  Theme.of(context).colorScheme.primary.withOpacity(0.25)
              : backgroundColor ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: borderColor ??
                backgroundColor ??
                Theme.of(context).colorScheme.primary,
            width: 1.5,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            leading ?? const SizedBox.shrink(),
            leading != null
                ? const SizedBox(width: 12.0)
                : const SizedBox.shrink(),
            Expanded(
              child: Text(
                message,
                softWrap: true,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                style: textStyle ??
                    TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: isLightBackground
                          ? backgroundColor ??
                              Theme.of(context).colorScheme.primary
                          : Colors.white,
                    ),
              ),
            ),

            // trailing ?? const SizedBox.shrink(),
            // trailing != null
            //     ? const SizedBox(width: 12.0)
            //     : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}

class ToastWithoutColor extends ToastProvider {
  final String message;
  final IconData? icon;
  // final Widget? trailing;
  final Color? iconColor;
  final TextStyle? textStyle;
  final int maxLines;
  final double radius;
  final double? height;

  const ToastWithoutColor({
    required this.message,
    required this.icon,
    // this.trailing,
    this.textStyle,
    this.maxLines = 2,
    this.iconColor,
    this.radius = 12,
    this.height,
  }) : super();

  const ToastWithoutColor.success({
    Key? key,
    required this.message,
    required this.icon,
    // this.trailing,
    this.textStyle,
    this.maxLines = 2,
    this.iconColor = Colors.green,
    this.radius = 12,
    this.height,
  }) : super();

  const ToastWithoutColor.error({
    Key? key,
    required this.message,
    required this.icon,
    // this.trailing,
    this.textStyle,
    this.maxLines = 2,
    this.iconColor = Colors.red,
    this.radius = 12,
    this.height,
  }) : super();

  const ToastWithoutColor.warning({
    Key? key,
    required this.message,
    required this.icon,
    // this.trailing,
    this.textStyle,
    this.maxLines = 2,
    this.iconColor = Colors.amber,
    this.radius = 12,
    this.height,
  }) : super();

  const ToastWithoutColor.info({
    Key? key,
    required this.message,
    required this.icon,
    // this.trailing,
    this.textStyle,
    this.maxLines = 2,
    this.iconColor = Colors.blue,
    this.radius = 12,
    this.height,
  }) : super();

  @override
  Widget show(BuildContext context, double? toastWidth) {
    bool isWeb = MediaQuery.of(context).size.width >= 1100;

    return Container(
      alignment: Alignment.centerLeft,
      height: height,
      padding: const EdgeInsets.all(12.0),
      width: isWeb ? toastWidth ?? 500 : MediaQuery.of(context).size.width - 32,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            offset: const Offset(0.0, 0.0),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      clipBehavior: Clip.hardEdge,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: iconColor?.withOpacity(0.25) ??
                  Theme.of(context).colorScheme.primary.withOpacity(0.25),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Icon(
              icon,
              color: iconColor ?? Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              message,
              softWrap: true,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: textStyle ??
                  const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
            ),
          ),
          // trailing ?? const SizedBox.shrink(),
          // trailing != null
          //     ? const SizedBox(width: 12.0)
          //     : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
