import 'dart:math';

import 'package:admin_dashboard/src/constant/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineScatterChart extends StatefulWidget {
  const LineScatterChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LineScatterChartState();
}

class _LineScatterChartState extends State {
  final maxX = 50.0;
  final maxY = 50.0;
  final radius = 4.0;
  Color blueColor = ColorConst.primary;
  Color yellowColor = ColorConst.chartColorYellow;

  @override
  Widget build(BuildContext context) {
    return ScatterChart(
      ScatterChartData(
        scatterSpots: randomData(),
        minX: 0,
        maxX: maxX,
        minY: 0,
        maxY: maxY,
        borderData: FlBorderData(
          show: false,
        ),
        gridData: FlGridData(
            show: true,
            verticalInterval: 6,
            getDrawingHorizontalLine: (_) => FlLine(
                  color: Theme.of(context).brightness == Brightness.light
                      ? ColorConst.gridChartColor
                      : Colors.black.withOpacity(0.2),
                ),
            getDrawingVerticalLine: (_) => FlLine(
                  color: Theme.of(context).brightness == Brightness.light
                      ? ColorConst.gridChartColor
                      : Colors.black.withOpacity(0.2),
                )),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getTitles,
              reservedSize: 42,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: 1,
              getTitlesWidget: leftTitles,
            ),
          ),
        ),
      ),
      swapAnimationDuration: const Duration(milliseconds: 600),
      swapAnimationCurve: Curves.fastOutSlowIn,
    );
  }

  List<ScatterSpot> randomData() {
    const blueColorCount = 21;
    const yellowColorCount = 57;
    const blackColorCount = 20;
    const greenColor = 35;
    return List.generate(
        blueColorCount + yellowColorCount + blackColorCount + greenColor, (i) {
      Color color;
      if (i < blueColorCount) {
        color = blueColor;
      } else if (i < blueColorCount + blackColorCount) {
        color = Theme.of(context).colorScheme.brightness == Brightness.dark
            ? Colors.white
            : Colors.black;
      } else if (i < blueColorCount + blackColorCount + greenColor) {
        color = ColorConst.chartColorGreen;
      } else {
        color = yellowColor;
      }
      return ScatterSpot(
        (Random().nextDouble() * (maxX - 8)) + 4,
        (Random().nextDouble() * (maxY - 8)) + 4,
        color: color,
        radius: (Random().nextDouble() * 2) + 4,
      );
    });
  }
}

Widget leftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  if (value == 0) {
    text = '0';
  } else if (value == 5) {
    text = '10';
  } else if (value == 10) {
    text = '20';
  } else if (value == 15) {
    text = '30';
  } else if (value == 20) {
    text = '40';
  } else if (value == 25) {
    text = '50';
  } else if (value == 30) {
    text = '60';
  } else if (value == 35) {
    text = '70';
  } else if (value == 40) {
    text = '80';
  } else if (value == 45) {
    text = '90';
  } else if (value == 50) {
    text = '100';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(text, style: style),
  );
}

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toString()) {
    case '0':
      text = 'W1';
      break;
    case '5':
      text = 'W2';
      break;
    case '10':
      text = 'W3';
      break;
    case '15':
      text = 'W4';
      break;
    case '20':
      text = 'W5';
      break;
    case '25':
      text = 'W6';
      break;
    case '30':
      text = 'W7';
      break;
    case '35':
      text = 'W8';
      break;
    case '40':
      text = 'W9';
      break;
    case '45':
      text = 'W10';
      break;
    case '50':
      text = 'W11';
      break;
    default:
      text = '9';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16.0,
    child: Text(text, style: style),
  );
}
