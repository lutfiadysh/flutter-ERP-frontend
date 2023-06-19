import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterx/src/constant/enum.dart';
import 'package:flutterx/src/utils/toast_offset.dart';

import 'toast_animation.dart';
import 'toast_provider.dart';

class FxToast {
  static OverlayEntry? _overlayEntry;
  static Timer? _timer;

  /// Use [ToastWithColor] or [ToastWithoutColor] for ToastProvider
  static Future<void> showToast(
      {required BuildContext context,
      ToastPosition? position = ToastPosition.top,
      required ToastProvider toast,
      Duration? displayDuration,
      Duration? animationDuration,
      double? toastWidth}) async {
    if (_timer != null) {
      _timer!.cancel();
      _overlayEntry != null ? _overlayEntry!.remove() : null;
    }
    _overlayEntry = _createOverlayEntry(
        context, toast, position!, animationDuration, toastWidth);
    Overlay.of(context).insert(_overlayEntry!);
    _timer = Timer(
      displayDuration ?? const Duration(seconds: 2),
      () {
        _timer!.cancel();
        _overlayEntry!.remove();
        _overlayEntry = null;
      },
    );
  }

  /// Use [ToastWithColor] or [ToastWithoutColor] for ToastProvider
  static show(BuildContext context, ToastProvider toast) {
    return Material(
      color: Colors.transparent,
      child: toast.show(context, null),
    );
  }

  static OverlayEntry _createOverlayEntry(
    BuildContext context,
    ToastProvider toast,
    ToastPosition position,
    Duration? duration,
    double? toastWidth,
  ) {
    bool isWeb = MediaQuery.of(context).size.width >= 1100;

    return OverlayEntry(
      builder: (context) => Positioned(
        top: position == ToastPosition.top ||
                position == ToastPosition.topLeft ||
                position == ToastPosition.topRight
            ? 16.0
            : null,
        left: isWeb
            ? position == ToastPosition.top || position == ToastPosition.bottom
                ? (MediaQuery.of(context).size.width - (toastWidth ?? 500.0)) /
                    2
                : null
            : null,
        right: isWeb
            ? position == ToastPosition.topRight ||
                    position == ToastPosition.bottomRight
                ? 0.0
                : null
            : null,
        bottom: position == ToastPosition.bottom ||
                position == ToastPosition.bottomLeft ||
                position == ToastPosition.bottomRight
            ? 16.0
            : null,
        child: ToastAnimation(
          offset: getOffset(position),
          duration: duration,
          child: Material(
            color: Colors.transparent,
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: toast.show(context, toastWidth),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
