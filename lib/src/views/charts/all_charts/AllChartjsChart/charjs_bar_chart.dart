import 'package:admin_dashboard/src/constant/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartJsBarChart extends StatelessWidget {
  const ChartJsBarChart({Key? key}) : super(key: key);
  final double width = 30;
  static const Color chartJsBarChart = Color(0xff37a499);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData(context),
        titlesData: titlesData,
        borderData: FlBorderData(show: false),
        barGroups: barGroups,
        gridData: FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 20,
      ),
    );
  }

  BarTouchData barTouchData(BuildContext context) {
    return BarTouchData(
      enabled: true,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: ColorConst.grey800,
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          return BarTooltipItem(
            rod.toY.toString(),
            const TextStyle(
              color: ColorConst.darkFontColor,
              fontWeight: FontWeight.w700,
            ),
          );
        },
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      default:
        text = 'Sep';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 28,
            interval: 5,
            getTitlesWidget: leftTitles,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

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
      text = '75';
    } else if (value == 10) {
      text = '150';
    } else if (value == 15) {
      text = '225';
    } else if (value == 20) {
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

  BarChartRodData _barChartRodData({
    required double toY,
  }) {
    return BarChartRodData(
      width: width,
      toY: toY,
      color: chartJsBarChart,
      borderRadius: BorderRadius.zero,
    );
  }

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            _barChartRodData(toY: 15),
          ],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            _barChartRodData(toY: 10),
          ],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            _barChartRodData(toY: 14),
          ],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            _barChartRodData(toY: 15),
          ],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            _barChartRodData(toY: 13),
          ],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            _barChartRodData(toY: 10),
          ],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            _barChartRodData(toY: 13),
          ],
        ),
        BarChartGroupData(
          x: 7,
          barRods: [
            _barChartRodData(toY: 5),
          ],
        ),
        BarChartGroupData(
          x: 8,
          barRods: [
            _barChartRodData(toY: 10),
          ],
        ),
      ];
}

class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xff2c4260),
        child: const ChartJsBarChart(),
      ),
    );
  }
}
