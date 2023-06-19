import 'package:flutter/material.dart';

class TranslateOnHover extends StatefulWidget {
  final Widget Function(bool isHover) builder;
  const TranslateOnHover({Key? key, required this.builder}) : super(key: key);
  @override
  State<TranslateOnHover> createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouserEnter(true),
      onExit: (e) => _mouserEnter(false),
      child: widget.builder(isHover),
    );
  }

  void _mouserEnter(bool isHovering) {
    setState(() {
      isHover = isHovering;
    });
  }
}
