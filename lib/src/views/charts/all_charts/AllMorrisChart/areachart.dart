import 'package:admin_dashboard/src/constant/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AreaChart extends StatefulWidget {
  const AreaChart({Key? key}) : super(key: key);

  @override
  State<AreaChart> createState() => _AreaChartState();
}

class _AreaChartState extends State<AreaChart> {
  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      mainData(),
    );
  }

  LineChartBarData _lineChartBarData({
    List<FlSpot>? spots,
    Color? color,
    Color? barDataColor,
  }) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      barWidth: 0,
      color: color,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: true,
        color: barDataColor,
      ),
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
        show: false,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: false,
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
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        _lineChartBarData(
          spots: const [
            FlSpot(0, 0),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          color: const Color(0xff81d7d0),
          barDataColor: const Color(0xff81d7d0).withOpacity(0.5),
        ),
        _lineChartBarData(
          spots: const [
            FlSpot(0, 0),
            FlSpot(1, 2),
            FlSpot(3, 2),
            FlSpot(5, 1.1),
            FlSpot(6, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          color: const Color(0xff5cb6c4),
          barDataColor: const Color(0xff5cb6c4).withOpacity(0.5),
        ),
        _lineChartBarData(
          spots: const [
            FlSpot(0, 2),
            FlSpot(2, 4),
            FlSpot(3, 2),
            FlSpot(5, 1.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          color: const Color(0xffaab1e6),
          barDataColor: const Color(0xffaab1e6).withOpacity(0.5),
        ),
      ],
    );
  }
}
