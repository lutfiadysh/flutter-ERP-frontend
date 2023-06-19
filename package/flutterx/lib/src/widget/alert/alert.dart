import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class FxAlert {
  FxAlert.showAlert({
    required BuildContext context,
    required String title,
    required Widget content,
    double radius = 8.0,
    Widget? icon,
    required List<Widget> actions,
    bool barrierDismissible = true,
    TextStyle? titleTextStyle,
    TextStyle? contentTextStyle,
    Color barrierColor = Colors.black54,
    MainAxisAlignment actionsAlignment = MainAxisAlignment.center,
    EdgeInsetsGeometry intentPadding = const EdgeInsets.all(12.0),
  }) {
    showDialog(
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Padding(
            padding: intentPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ?? const SizedBox.shrink(),
                icon != null ? FxBox.h20 : const SizedBox.shrink(),
                Text(title,
                    style: titleTextStyle ??
                        Theme.of(context).textTheme.titleLarge),
                FxBox.h8,
                content,
                FxBox.h20,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: actionsAlignment,
                  children: actions
                      .map((e) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: e,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
