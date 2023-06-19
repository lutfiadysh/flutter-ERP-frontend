import 'package:admin_dashboard/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AdvancedSmilChart extends StatelessWidget {
  const AdvancedSmilChart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //print(dummyData1);
    return LineChart(
      LineChartData(
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: ColorConst.grey800,
            getTooltipItems: (touchedSpots) {
              List<double> value = [];
              for (LineBarSpot lineBarSpot in touchedSpots) {
                value.add(lineBarSpot.y);
              }
              return value
                  .map(
                    (e) => LineTooltipItem(
                      e.toString(),
                      const TextStyle(
                        color: ColorConst.darkFontColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                  .toList();
            },
          ),
        ),
        gridData: FlGridData(
            show: true,
            verticalInterval: 1,
            getDrawingHorizontalLine: (_) =>
                FlLine(color: ColorConst.gridChartColor, strokeWidth: 0.5),
            getDrawingVerticalLine: (_) =>
                FlLine(color: ColorConst.gridChartColor, strokeWidth: 0.5)),
        borderData: FlBorderData(show: false),
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
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 0),
              FlSpot(1, 0.07),
              FlSpot(2, 1.69),
              FlSpot(3, 0.55),
              FlSpot(4, 3.36),
              FlSpot(5, 0.92),
              FlSpot(6, 5.00),
              FlSpot(7, 2.83)
            ],
            isCurved: true,
            barWidth: 2,
            color: ColorConst.primary,
          ),
          LineChartBarData(
            spots: const [
              FlSpot(0, 0),
              FlSpot(1, 0.88),
              FlSpot(2, 0.13),
              FlSpot(3, 2.70),
              FlSpot(4, 2.36),
              FlSpot(5, 2.04),
              FlSpot(6, 1.08),
              FlSpot(7, 2.21)
            ],
            isCurved: true,
            barWidth: 2,
            color: ColorConst.chartColorGreen,
          ),
          LineChartBarData(spots: const [
            FlSpot(0, 0),
            FlSpot(1, 0.60),
            FlSpot(2, 0.88),
            FlSpot(3, 1.84),
            FlSpot(4, 1.57),
            FlSpot(5, 3.54),
            FlSpot(6, 1.13),
            FlSpot(7, 5.32)
          ], isCurved: true, barWidth: 2, color: ColorConst.black),
          LineChartBarData(spots: const [
            FlSpot(0, 0),
            FlSpot(1, 0.43),
            FlSpot(2, 0.997),
            FlSpot(3, 1.95),
            FlSpot(4, 1.27),
            FlSpot(5, 1.85),
            FlSpot(6, 0.52),
            FlSpot(7, 1.96)
          ], isCurved: true, barWidth: 2, color: ColorConst.chartColorYellow),
        ],
      ),
    );
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
  } else if (value == 1) {
    text = '2.5';
  } else if (value == 2) {
    text = '5';
  } else if (value == 3) {
    text = '7.5';
  } else if (value == 4) {
    text = '10';
  } else if (value == 5) {
    text = '12.5';
  } else if (value == 6) {
    text = '15';
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
      text = '1';
      break;
    case '0.5':
      text = '';
      break;
    case '1':
      text = '2';
      break;
    case '1.5':
      text = '';
      break;
    case '2':
      text = '3';
      break;
    case '2.5':
      text = '';
      break;
    case '3':
      text = '4';
      break;
    case '3.5':
      text = '';
      break;
    case '4':
      text = '5';
      break;
    case '4.5':
      text = '';
      break;
    case '5':
      text = '6';
      break;
    case '5.5':
      text = '';
      break;
    case '6':
      text = '7';
      break;
    case '6.5':
      text = '';
      break;
    case '7':
      text = '8';
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
