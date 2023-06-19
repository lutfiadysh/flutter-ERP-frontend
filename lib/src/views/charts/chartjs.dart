import 'package:admin_dashboard/src/constant/enum.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/utils/charts/chartsutils.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class ChartJsChart extends StatefulWidget {
  const ChartJsChart({Key? key}) : super(key: key);

  @override
  State<ChartJsChart> createState() => _ChartJsChartState();
}

class _ChartJsChartState extends State<ChartJsChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: Responsive.isTablet(context) || Responsive.isMobile(context)
          ? [
              _card(ChartType.chartJsBarChart, context, Strings.barChart),
              FxBox.h20,
              _card(ChartType.multipleStaticChart, context,
                  Strings.multipleStaticsChart),
              FxBox.h20,
              _card(ChartType.polarChart, context, Strings.polarChart),
              FxBox.h20,
            ]
          : [
              Row(
                children: [
                  Expanded(
                    child: _card(
                        ChartType.chartJsBarChart, context, Strings.barChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.multipleStaticChart, context,
                        Strings.multipleStaticsChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(
                        ChartType.polarChart, context, Strings.polarChart),
                  ),
                ],
              ),
              FxBox.h20,
              // Row(
              //   children: [
              //     Expanded(
              //       child: _card(
              //           ChartType.polarChart, context, Strings.polarChart),
              //     ),
              //     FxBox.w20,
              //     Expanded(
              //       child: _card(
              //           ChartType.radarChart, context, Strings.radarChart),
              //     ),
              //   ],
              // ),
            ],
    );
  }
}

Widget _card(ChartType chartType, BuildContext context, String name) {
  return SizedBox(
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
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
    if (chartType == ChartType.chartJsBarChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 3591, context),
            FxBox.h12,
            _richText(Strings.pending, 83875, context),
            FxBox.h12,
            _richText(Strings.deactivated, 13303, context),
          ],
        ),
      );
    } else if (chartType == ChartType.multipleStaticChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 334619, context),
            FxBox.h12,
            _richText(Strings.pending, 8369, context),
            FxBox.h12,
            _richText(Strings.deactivated, 935422, context),
          ],
        ),
      );
    } else if (chartType == ChartType.radarChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 604, context),
            FxBox.h12,
            _richText(Strings.pending, 59240, context),
            FxBox.h12,
            _richText(Strings.deactivated, 439448, context),
          ],
        ),
      );
    } else if (chartType == ChartType.polarChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 4342, context),
            FxBox.h12,
            _richText(Strings.pending, 3354, context),
            FxBox.h12,
            _richText(Strings.deactivated, 74611, context),
          ],
        ),
      );
    }
  } else {
    if (chartType == ChartType.chartJsBarChart) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 3591, context),
          _richText(Strings.pending, 83875, context),
          _richText(Strings.deactivated, 13303, context),
        ],
      );
    } else if (chartType == ChartType.multipleStaticChart) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 334619, context),
          _richText(Strings.pending, 8369, context),
          _richText(Strings.deactivated, 935422, context),
        ],
      );
    } else if (chartType == ChartType.radarChart) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 604, context),
          _richText(Strings.pending, 59240, context),
          _richText(Strings.deactivated, 439448, context),
        ],
      );
    } else if (chartType == ChartType.polarChart) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 4342, context),
          _richText(Strings.pending, 3354, context),
          _richText(Strings.deactivated, 74611, context),
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
