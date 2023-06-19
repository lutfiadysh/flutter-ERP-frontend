import 'package:admin_dashboard/src/constant/enum.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/utils/charts/chartsutils.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class ChartListChart extends StatefulWidget {
  const ChartListChart({Key? key}) : super(key: key);

  @override
  State<ChartListChart> createState() => _ChartListChartState();
}

class _ChartListChartState extends State<ChartListChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: Responsive.isTablet(context) || Responsive.isMobile(context)
          ? [
              _card(ChartType.animatingPieChart, context,
                  Strings.animatingPieChart),
              FxBox.h20,
              _card(ChartType.simplePieChart, context, Strings.simplePieChart),
              FxBox.h20,
              _card(ChartType.advancedSmileChart, context,
                  Strings.advanceSmileAnimationChart),
              FxBox.h20,
              _card(
                  ChartType.simpleLineChart, context, Strings.simpleLineChart),
              FxBox.h20,
              _card(ChartType.lineScatterChart, context,
                  Strings.lineScatterChart),
              FxBox.h20,
              _card(ChartType.lineChartWithArea, context,
                  Strings.lineChartWithArea),
              FxBox.h20,
              _card(ChartType.overlapBars, context, Strings.overlappingChart),
            ]
          : [
              Row(
                children: [
                  Expanded(
                    child: _card(ChartType.animatingPieChart, context,
                        Strings.animatingPieChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.simplePieChart, context,
                        Strings.simplePieChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.advancedSmileChart, context,
                        Strings.advanceSmileAnimationChart),
                  ),
                ],
              ),
              FxBox.h20,
              Row(
                children: [
                  Expanded(
                    child: _card(ChartType.simpleLineChart, context,
                        Strings.simpleLineChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.lineScatterChart, context,
                        Strings.lineScatterChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.lineChartWithArea, context,
                        Strings.lineChartWithArea),
                  ),
                ],
              ),
              FxBox.h20,
              Row(
                children: [
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.overlapBars, context,
                        Strings.overlappingChart),
                  ),
                ],
              ),
              FxBox.h20,
            ],
    );
  }
}

Widget _card(ChartType chartType, BuildContext context, String name) {
  return SizedBox(
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            FxBox.h12,
            // getChartData(chartType, context),
            FxBox.h12,
            SizedBox(
              width: double.infinity,
              height: 400,
              child: getChart(chartType),
            ),
          ],
        ),
      ),
    ),
  );
}

getChartData(ChartType chartType, BuildContext context) {
  if (Responsive.isMobile(context)) {
    if (chartType == ChartType.advancedSmileChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(children: [
          _richText(Strings.activated, 40410, context),
          FxBox.h12,
          _richText(Strings.pending, 4042, context),
          FxBox.h12,
          _richText(Strings.deactivated, 3291, context),
        ]),
      );
    } else if (chartType == ChartType.lineChartWithArea) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 4204, context),
            FxBox.h12,
            _richText(Strings.pending, 67591, context),
            FxBox.h12,
            _richText(Strings.deactivated, 90581, context),
          ],
        ),
      );
    } else if (chartType == ChartType.lineScatterChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 5697, context),
            FxBox.h12,
            _richText(Strings.pending, 2331, context),
            FxBox.h12,
            _richText(Strings.deactivated, 109330, context),
          ],
        ),
      );
    } else if (chartType == ChartType.simpleLineChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 48942, context),
            _richText(Strings.pending, 79201, context),
            _richText(Strings.pending, 25331, context)
          ],
        ),
      );
    } else if (chartType == ChartType.overlapBars) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 85531, context),
            _richText(Strings.pending, 2251, context),
            _richText(Strings.deactivated, 152620, context),
          ],
        ),
      );
    } else if (chartType == ChartType.simplePieChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 38464, context),
            _richText(Strings.pending, 42652, context),
            _richText(Strings.deactivated, 25452, context),
          ],
        ),
      );
    } else if (chartType == ChartType.animatingPieChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 768699, context),
            _richText(Strings.pending, 5561, context),
            _richText(Strings.deactivated, 161620, context),
          ],
        ),
      );
    }
  } else {
    if (chartType == ChartType.advancedSmileChart) {
      return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _richText(Strings.activated, 40410, context),
        _richText(Strings.pending, 4042, context),
        _richText(Strings.deactivated, 3291, context),
      ]);
    } else if (chartType == ChartType.simpleLineChart) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 4204, context),
          _richText(Strings.pending, 67591, context),
          _richText(Strings.deactivated, 90581, context),
        ],
      );
    } else if (chartType == ChartType.lineChartWithArea) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 5697, context),
          _richText(Strings.pending, 2331, context),
          _richText(Strings.deactivated, 109330, context),
        ],
      );
    } else if (chartType == ChartType.simplePieChart) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 38464, context),
          _richText(Strings.pending, 42652, context),
          _richText(Strings.deactivated, 25452, context),
        ],
      );
    } else if (chartType == ChartType.animatingPieChart) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 768699, context),
          _richText(Strings.pending, 5561, context),
          _richText(Strings.deactivated, 161620, context),
        ],
      );
    } else if (chartType == ChartType.lineScatterChart) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 5697, context),
          _richText(Strings.pending, 2331, context),
          _richText(Strings.deactivated, 109330, context),
        ],
      );
    } else if (chartType == ChartType.overlapBars) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 85531, context),
          _richText(Strings.pending, 2251, context),
          _richText(Strings.deactivated, 152620, context),
        ],
      );
    }
  }
}

Widget _richText(String type, int count, BuildContext context) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: DefaultTextStyle.of(context).style,
      children: <TextSpan>[
        TextSpan(
          text: upperCase('$count\n'),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        TextSpan(
          text: upperCase(type),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
