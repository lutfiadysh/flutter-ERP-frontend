import 'package:flutter/material.dart';
import 'package:flutterx/src/constant/enum.dart';

Offset getOffset(ToastPosition position) {
  if (position == ToastPosition.top) {
    return const Offset(0.0, -1.0);
  } else if (position == ToastPosition.topLeft) {
    return const Offset(-1.0, 0.0);
  } else if (position == ToastPosition.topRight) {
    return const Offset(1.0, 0.0);
  } else if (position == ToastPosition.bottomLeft) {
    return const Offset(-1.0, 0.0);
  } else if (position == ToastPosition.bottomRight) {
    return const Offset(1.0, 0.0);
  } else {
    return const Offset(0.0, 1.0);
  }
}
