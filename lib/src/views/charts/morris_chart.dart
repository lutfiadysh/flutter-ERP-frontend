import 'package:admin_dashboard/src/constant/enum.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/utils/charts/chartsutils.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class MorrisChart extends StatefulWidget {
  const MorrisChart({Key? key}) : super(key: key);

  @override
  State<MorrisChart> createState() => _MorrisChartState();
}

class _MorrisChartState extends State<MorrisChart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: Responsive.isTablet(context) || Responsive.isMobile(context)
          ? [
              _card(ChartType.lineChart, context, Strings.lineChart),
              FxBox.h20,
              _card(ChartType.barChart, context, Strings.barChart),
              FxBox.h20,
              _card(ChartType.areaChart, context, Strings.areaChart),
              FxBox.h20,
              _card(ChartType.piaChart, context, Strings.donutChart),
              FxBox.h20,
              _card(ChartType.colomnChart, context, Strings.columnChart),
            ]
          : [
              Row(
                children: [
                  Expanded(
                    child:
                        _card(ChartType.lineChart, context, Strings.lineChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child:
                        _card(ChartType.piaChart, context, Strings.donutChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(ChartType.barChart, context, Strings.barChart),
                  ),
                ],
              ),
              FxBox.h20,
              Row(
                children: [
                  Expanded(
                    child:
                        _card(ChartType.areaChart, context, Strings.areaChart),
                  ),
                  FxBox.w20,
                  Expanded(
                    child: _card(
                        ChartType.colomnChart, context, Strings.columnChart),
                  ),
                ],
              ),
            ],
    );
  }
}

Widget _card(ChartType chartType, BuildContext context, String name) {
  return Card(
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
  );
}

getChartData(ChartType chartType, BuildContext context) {
  if (Responsive.isMobile(context)) {
    if (chartType == ChartType.lineChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(children: [
          _richText(Strings.activated, 18610, context),
          FxBox.h12,
          _richText(Strings.pending, 42210, context),
          FxBox.h12,
          _richText(Strings.deactivated, 10185, context),
        ]),
      );
    } else if (chartType == ChartType.barChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 42010, context),
            FxBox.h12,
            _richText(Strings.pending, 68210, context),
            FxBox.h12,
          ],
        ),
      );
    } else if (chartType == ChartType.areaChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 42010, context),
            FxBox.h12,
            _richText(Strings.pending, 2041, context),
            FxBox.h12,
            _richText(Strings.deactivated, 68210, context),
          ],
        ),
      );
    } else if (chartType == ChartType.piaChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 2041, context),
            FxBox.h12,
            _richText(Strings.pending, 42010, context),
            FxBox.h12,
            _richText(Strings.deactivated, 68210, context),
          ],
        ),
      );
    } else if (chartType == ChartType.colomnChart) {
      return Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            _richText(Strings.activated, 42010, context),
            FxBox.h12,
            _richText(Strings.pending, 2041, context),
            FxBox.h12,
            _richText(Strings.deactivated, 68210, context),
          ],
        ),
      );
    }
  } else {
    if (chartType == ChartType.lineChart) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 42010, context),
          _richText(Strings.pending, 56910, context),
          _richText(Strings.deactivated, 68210, context),
        ],
      );
    } else if (chartType == ChartType.barChart) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 605312, context),
          _richText(Strings.pending, 123442, context),
        ],
      );
    } else if (chartType == ChartType.areaChart) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 82531, context),
          _richText(Strings.pending, 2521, context),
          _richText(Strings.deactivated, 102335, context),
        ],
      );
    } else if (chartType == ChartType.piaChart) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 3251, context),
          _richText(Strings.pending, 85330, context),
          _richText(Strings.deactivated, 346414, context),
        ],
      );
    } else if (chartType == ChartType.colomnChart) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _richText(Strings.activated, 86231, context),
          _richText(Strings.pending, 2441, context),
          _richText(Strings.deactivated, 102400, context),
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
            fontSize: 23,
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
