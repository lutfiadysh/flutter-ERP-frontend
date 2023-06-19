import 'package:admin_dashboard/src/constant/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWithArea extends StatefulWidget {
  const LineChartWithArea({Key? key}) : super(key: key);

  @override
  State<LineChartWithArea> createState() => _LineChartWithAreaState();
}

class _LineChartWithAreaState extends State<LineChartWithArea> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      mainData(),
    );
  }

  LineChartData mainData() {
    return LineChartData(
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
      borderData: FlBorderData(border: const Border(bottom: BorderSide.none)),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
      ),
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
            reservedSize: 30,
            interval: 1,
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
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          color: ColorConst.primary,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData:
              BarAreaData(show: true, color: ColorConst.chartForgoundColor),
        ),
      ],
    );
  }
}

Widget leftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  if (value == 0) {
    text = '0';
  } else if (value == 1) {
    text = '1';
  } else if (value == 2) {
    text = '2';
  } else if (value == 3) {
    text = '3';
  } else if (value == 4) {
    text = '4';
  } else if (value == 5) {
    text = '5';
  } else if (value == 6) {
    text = '6';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 12,
    child: Text(text, style: style),
  );
}
