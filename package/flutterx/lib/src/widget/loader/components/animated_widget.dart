import 'package:flutter/widgets.dart';

class AnimatedPartWidget extends StatelessWidget {
  final Color color;
  final BoxShape shape;
  const AnimatedPartWidget({
    Key? key,
    required this.color,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        shape: shape,
      ),
    );
  }
}
