import 'package:admin_dashboard/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SimpleLineChart extends StatelessWidget {
  const SimpleLineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            verticalInterval: 2,
            getDrawingHorizontalLine: (_) => FlLine(
                  color: Colors.grey.withOpacity(0.1),
                ),
            getDrawingVerticalLine: (_) => FlLine(
                  color: Colors.grey.withOpacity(0.1),
                )),
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
          _lineChartBarData(
            spots: const [
              FlSpot(0, 5),
              FlSpot(2.6, 4),
              FlSpot(4.9, 5),
              FlSpot(8, 4),
              FlSpot(9.5, 3),
              FlSpot(11, 4),
            ],
            color: ColorConst.primary,
          ),
          _lineChartBarData(
            spots: const [
              FlSpot(0, 1),
              FlSpot(2.6, 2),
              FlSpot(4.9, 2),
              FlSpot(8, 4),
              FlSpot(9.5, 2),
            ],
            color: const Color(0xff37a499),
          ),
          _lineChartBarData(
            spots: const [
              FlSpot(0, 0),
              FlSpot(1.6, 1),
              FlSpot(3.9, 1),
              FlSpot(8, 3),
              FlSpot(9.5, 1),
            ],
            color: const Color(0xff6fab42),
          ),
        ],
      ),
    );
  }
}

LineChartBarData _lineChartBarData({
  List<FlSpot>? spots,
  Color? color,
}) {
  return LineChartBarData(
    spots: spots,
    isCurved: true,
    color: color,
    barWidth: 2,
    isStrokeCapRound: false,
    dotData: FlDotData(
      show: true,
    ),
  );
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
    space: 5,
    child: Text(text, style: style),
  );
}

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 13,
  );
  String text;
  switch (value.toString()) {
    case '0':
      text = 'Monday';
      break;

    case '2':
      text = 'Tuesday';
      break;

    case '4':
      text = 'Wednesday';
      break;

    case '6':
      text = 'Thursday';
      break;

    case '8':
      text = 'Friday';
      break;

    case '10':
      text = 'Saturday';
      break;

    default:
      text = '';
      break;
  }
  return Padding(
    padding: const EdgeInsets.only(left: 15),
    child: SideTitleWidget(
      axisSide: meta.axisSide,
      space: 12.0,
      child: Text(
        text,
        style: style,
      ),
    ),
  );
}
