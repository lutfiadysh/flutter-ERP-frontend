import 'package:flutter/material.dart';

class FxSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeStart;
  final ValueChanged<double>? onChangeEnd;
  final int? divisions;
  final String? label;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final double min;
  final double max;
  final double? trackHeight;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? overlayColor;
  final double? overlayRadius;
  final Color? activeTickMarkColor;
  final Color? inactiveTickMarkColor;
  final Color? valueIndicatorColor;
  final TextStyle? textStyle;

  const FxSlider({
    Key? key,
    required this.value,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    required this.min,
    required this.max,
    this.divisions,
    this.label,
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.trackHeight,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.overlayColor,
    this.overlayRadius,
    this.activeTickMarkColor,
    this.inactiveTickMarkColor,
    this.valueIndicatorColor,
    this.textStyle,
  })  : assert(min <= max),
        assert(value >= min && value <= max),
        assert(divisions == null || divisions > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: trackHeight,
        trackShape: const RoundedRectSliderTrackShape(),
        activeTrackColor: activeTrackColor,
        inactiveTrackColor: inactiveTrackColor,
        thumbColor: thumbColor,
        overlayColor: overlayColor,
        overlayShape: RoundSliderOverlayShape(
          overlayRadius: overlayRadius ?? 12.0,
        ),
        tickMarkShape: const RoundSliderTickMarkShape(),
        activeTickMarkColor: activeTickMarkColor,
        inactiveTickMarkColor: inactiveTickMarkColor,
        valueIndicatorShape: const RectangularSliderValueIndicatorShape(),
        valueIndicatorColor: valueIndicatorColor,
        valueIndicatorTextStyle: textStyle,
      ),
      child: Slider(
        min: min,
        max: max,
        value: value,
        onChanged: onChanged,
        onChangeStart: onChangeStart,
        onChangeEnd: onChangeEnd,
        divisions: divisions,
        label: label,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        thumbColor: thumbColor,
      ),
    );
  }
}
