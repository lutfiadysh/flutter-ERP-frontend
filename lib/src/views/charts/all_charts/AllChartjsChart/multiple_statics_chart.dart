import 'package:admin_dashboard/src/constant/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MultipleStaticChart extends StatefulWidget {
  const MultipleStaticChart({Key? key}) : super(key: key);

  @override
  State<MultipleStaticChart> createState() => _MultipleStaticChartState();
}

class _MultipleStaticChartState extends State<MultipleStaticChart> {
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
      isCurved: false,
      barWidth: 3,
      color: color,
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
          show: true,
          verticalInterval: 1,
          getDrawingHorizontalLine: (_) => FlLine(
                color: Colors.grey.withOpacity(0.1),
              ),
          getDrawingVerticalLine: (_) => FlLine(
                color: Colors.grey.withOpacity(0.1),
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
          color: const Color(0xff59a99f),
          barDataColor: const Color(0xff97d1cd),
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
          color: ColorConst.primary,
          barDataColor: ColorConst.primary.withOpacity(0.5),
        ),
      ],
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
    text = '50';
  } else if (value == 2) {
    text = '100';
  } else if (value == 3) {
    text = '150';
  } else if (value == 4) {
    text = '200';
  } else if (value == 5) {
    text = '250';
  } else if (value == 6) {
    text = '300';
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
      text = '0';
      break;
    case '0.5':
      text = '';
      break;
    case '1':
      text = '';
      break;
    case '1.5':
      text = '1.0';
      break;
    case '2':
      text = '';
      break;
    case '2.5':
      text = '';
      break;
    case '3':
      text = '2.0';
      break;
    case '3.5':
      text = '';
      break;
    case '4':
      text = '';
      break;
    case '4.5':
      text = '3.0';
      break;
    case '5':
      text = '';
      break;
    case '5.5':
      text = '';
      break;
    case '6':
      text = '4.0';
      break;
    case '6.5':
      text = '';
      break;
    case '7':
      text = '';
      break;
    case '8':
      text = '5.0';
      break;
    case '9':
      text = '';
      break;
    case '10':
      text = '6.0';
      break;
    case '11':
      text = '';
      break;
    default:
      text = '';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16.0,
    child: Text(text, style: style),
  );
}
