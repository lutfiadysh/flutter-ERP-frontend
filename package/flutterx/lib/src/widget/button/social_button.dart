import 'dart:math' as math;
import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';
import 'package:flutterx/src/constant/color.dart';
import 'package:flutterx/src/utils/hover.dart';
import 'package:flutterx/src/widget/sizedbox.dart';

class SocialButton extends StatelessWidget {
  final bool fullWidth;
  final Widget? icon;
  final bool isOutlineButton;
  final double borderWidth;
  final double borderRadius;
  final void Function()? onPressed;
  final void Function()? onLongPress;
  final void Function(bool)? onHighlightChanged;
  final MouseCursor? mouseCursor;
  final double? minWidth;
  final double? height;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? text;
  final Color? textColor;
  final bool enableFeedback;
  final EdgeInsetsGeometry? padding;
  final double? elevation;
  final double? hoverElevation;
  final Color? color;
  final Color? hoverColor;
  final String type;

  const SocialButton.whatsApp({
    Key? key,
    this.fullWidth = false,
    this.icon = const Icon(Icons.call),
    this.isOutlineButton = false,
    this.borderWidth = 1.0,
    this.borderRadius = 4.0,
    required this.onPressed,
    this.onLongPress,
    this.onHighlightChanged,
    this.mouseCursor,
    this.minWidth,
    this.height,
    this.autofocus = false,
    this.focusNode,
    this.text = 'WhatsApp',
    this.textColor,
    this.enableFeedback = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
    this.elevation,
    this.hoverElevation,
    this.color,
    this.hoverColor,
  })  : assert((fullWidth && minWidth == null) ||
            (!fullWidth && minWidth != null) ||
            (!fullWidth && minWidth == null)),
        assert(elevation == null || elevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        type = 'WhatsApp',
        super(key: key);

  const SocialButton.facebook({
    Key? key,
    this.fullWidth = false,
    this.icon = const Icon(Icons.facebook_rounded),
    this.isOutlineButton = false,
    this.borderWidth = 1.0,
    this.borderRadius = 4.0,
    required this.onPressed,
    this.onLongPress,
    this.onHighlightChanged,
    this.mouseCursor,
    this.minWidth,
    this.height,
    this.autofocus = false,
    this.focusNode,
    this.text = 'Facebook',
    this.textColor,
    this.enableFeedback = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
    this.elevation,
    this.hoverElevation,
    this.color,
    this.hoverColor,
  })  : assert((fullWidth && minWidth == null) ||
            (!fullWidth && minWidth != null) ||
            (!fullWidth && minWidth == null)),
        assert(elevation == null || elevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        type = 'Facebook',
        super(key: key);

  const SocialButton.apple({
    Key? key,
    this.icon = const Icon(Icons.apple_rounded),
    this.isOutlineButton = false,
    this.borderWidth = 1.0,
    this.borderRadius = 4.0,
    required this.onPressed,
    this.onLongPress,
    this.onHighlightChanged,
    this.mouseCursor,
    this.minWidth = 140,
    this.height = 30,
    this.autofocus = false,
    this.focusNode,
    this.text = 'Apple',
    this.textColor,
    this.enableFeedback = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
    this.elevation,
    this.hoverElevation,
    this.color,
    this.hoverColor,
  })  : assert(minWidth == null || minWidth == 140.0 || minWidth == 280.0),
        assert(height == null || height == 30.0 || height == 60.0),
        assert(elevation == null || elevation >= 0.0),
        assert(hoverElevation == null || hoverElevation >= 0.0),
        type = 'Apple',
        fullWidth = false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double gap =
        scale <= 1 ? 8 : lerpDouble(8, 4, math.min(scale - 1, 1))!;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return TranslateOnHover(
      builder: (isHover) {
        return MaterialButton(
          enableFeedback: enableFeedback,
          autofocus: autofocus,
          onPressed: onPressed,
          onLongPress: onLongPress,
          onHighlightChanged: onHighlightChanged,
          mouseCursor: mouseCursor,
          elevation: isOutlineButton ? 0.0 : elevation,
          hoverElevation: isOutlineButton ? 0.0 : hoverElevation,
          padding: padding,
          colorBrightness: Theme.of(context).brightness,
          color: type == 'Apple' && isOutlineButton
              ? FxColor.white
              : color ?? _getButtonColor(colorScheme, isOutlineButton, type),
          hoverColor: hoverColor ??
              _getHoverButtonColor(colorScheme, isOutlineButton, type),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              width: borderWidth,
              color: isOutlineButton
                  ? color ?? _getButtonColor(colorScheme, false, type)!
                  : color ?? _getButtonColor(colorScheme, true, type)!,
            ),
          ),
          minWidth: icon != null
              ? 56.0
              : fullWidth
                  ? double.infinity
                  : minWidth,
          height: text == null ? 56.0 : height,
          textColor: isHover
              ? _getHoverFontColor(colorScheme, isOutlineButton, type)
              : _getFontColor(colorScheme, isOutlineButton, type),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon ?? FxBox.shrink,
              icon != null && text != null
                  ? SizedBox(width: gap)
                  : FxBox.shrink,
              text != null ? Flexible(child: Text(text!)) : FxBox.shrink,
            ],
          ),
        );
      },
    );
  }
}

Color? _getButtonColor(
    ColorScheme colorScheme, bool isOutlineButton, String type) {
  if (isOutlineButton) {
    return Colors.transparent;
  }
  if (type == 'WhatsApp') {
    return FxColor.whatsApp;
  } else if (type == 'Facebook') {
    return FxColor.facebookDark;
  } else if (type == 'Apple') {
    return colorScheme.brightness == Brightness.light
        ? FxColor.appleDark
        : FxColor.appleLight;
  } else {
    return colorScheme.primary;
  }
}

Color? _getHoverButtonColor(
    ColorScheme colorScheme, bool isOutlineButton, String type) {
  if (isOutlineButton) {
    return _getButtonColor(colorScheme, false, type);
  }
  if (type == 'WhatsApp') {
    return FxColor.whatsAppDark;
  } else if (type == 'Facebook') {
    return FxColor.facebook;
  } else if (type == 'Apple') {
    return colorScheme.brightness == Brightness.light
        ? FxColor.appleDark
        : FxColor.appleLight;
  } else {
    if (colorScheme.brightness == Brightness.dark) {
      return colorScheme.inversePrimary;
    } else {
      return colorScheme.onPrimaryContainer;
    }
  }
}

Color? _getFontColor(
    ColorScheme colorScheme, bool isOutlineButton, String type) {
  if (isOutlineButton) {
    if (type == 'Apple') {
      return FxColor.appleDark;
    }
    return _getButtonColor(colorScheme, false, type);
  }
  if (type == 'WhatsApp' || type == 'Facebook') {
    return FxColor.white;
  } else if (type == 'Apple') {
    return colorScheme.brightness == Brightness.light
        ? FxColor.appleLight
        : FxColor.appleDark;
  } else {
    return colorScheme.onPrimary;
  }
}

Color? _getHoverFontColor(
    ColorScheme colorScheme, bool isOutlineButton, String type) {
  if (isOutlineButton) {
    return _getFontColor(colorScheme, false, type);
  }
  if (type == 'WhatsApp' || type == 'Facebook') {
    return FxColor.white;
  } else if (type == 'Apple') {
    return colorScheme.brightness == Brightness.light
        ? FxColor.appleLight
        : FxColor.appleDark;
  } else {
    if (colorScheme.brightness == Brightness.dark) {
      return colorScheme.onPrimaryContainer;
    } else {
      return colorScheme.onPrimary;
    }
  }
}
