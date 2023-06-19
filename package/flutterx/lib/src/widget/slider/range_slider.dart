import 'package:flutter/material.dart';

class FxRangeSlider extends StatelessWidget {
  final RangeValues values;
  final ValueChanged<RangeValues>? onChanged;
  final ValueChanged<RangeValues>? onChangeStart;
  final ValueChanged<RangeValues>? onChangeEnd;
  final double min;
  final double max;
  final int? divisions;
  final RangeLabels? labels;
  final Color? thumbColor;
  final Color? activeColor;
  final Color? inactiveColor;
  final double? trackHeight;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? overlayColor;
  final double? overlayRadius;
  final Color? activeTickMarkColor;
  final Color? inactiveTickMarkColor;
  final Color? valueIndicatorColor;
  final TextStyle? textStyle;

  FxRangeSlider({
    Key? key,
    required this.values,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    required this.min,
    required this.max,
    this.divisions,
    this.labels,
    this.activeColor,
    this.inactiveColor,
    this.trackHeight,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.overlayColor,
    this.overlayRadius,
    this.activeTickMarkColor,
    this.inactiveTickMarkColor,
    this.valueIndicatorColor,
    this.textStyle,
    this.thumbColor,
  })  : assert(min <= max),
        assert(values.start <= values.end),
        assert(values.start >= min && values.start <= max),
        assert(values.end >= min && values.end <= max),
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
      child: RangeSlider(
        min: min,
        max: max,
        values: values,
        onChanged: onChanged,
        onChangeStart: onChangeStart,
        onChangeEnd: onChangeEnd,
        divisions: divisions,
        labels: labels,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
      ),
    );
  }
}
