import 'package:admin_dashboard/src/constant/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ColumnChart extends StatelessWidget {
  const ColumnChart({Key? key}) : super(key: key);
  final double width = 30;

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
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: const EdgeInsets.all(0),
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.toY.round().toString(),
            TextStyle(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
                fontWeight: FontWeight.bold),
          );
        },
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    TextStyle style;
    style =  TextStyle(
      color: ColorConst.gridTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '2010';
        break;
      case 1:
        text = '2011';
        break;
      case 2:
        text = '2012';
        break;
      case 3:
        text = '2013';
        break;
      case 4:
        text = '2014';
        break;
      case 5:
        text = '2015';
        break;
      case 6:
        text = '2016';
        break;
      case 7:
        text = '2017';
        break;
      default:
        text = '2018';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 12.0,
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
            interval: 1,
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
    TextStyle style;
    style =  TextStyle(
      color: ColorConst.gridTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 10) {
      text = '75';
    } else if (value == 19) {
      text = '150';
    } else if (value == 22) {
      text = '225';
    } else if (value == 25) {
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
  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              width: width,
              toY: 15,
              color: Colors.transparent,
              rodStackItems: [
                BarChartRodStackItem(0, 7, const Color(0xff3c4bd0)),
                BarChartRodStackItem(7, 15, Colors.grey.withOpacity(0.1)),
              ],
              borderRadius: BorderRadius.zero,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
                width: width,
                toY: 10,
                color: Colors.transparent,
                rodStackItems: [
                  BarChartRodStackItem(0, 5, ColorConst.blueChartColor ),
                  BarChartRodStackItem(5, 10, Colors.grey.withOpacity(0.1)),
                ],
                borderRadius: BorderRadius.zero)
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
                width: width,
                toY: 14,
                color: Colors.transparent,
                rodStackItems: [
                  BarChartRodStackItem(0, 7, const Color(0xff3c4bd0)),
                  BarChartRodStackItem(7, 14, Colors.grey.withOpacity(0.1)),
                ],
                borderRadius: BorderRadius.zero)
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
                width: width,
                toY: 15,
                color: Colors.transparent,
                rodStackItems: [
                  BarChartRodStackItem(0, 7, const Color(0xff3c4bd0)),
                  BarChartRodStackItem(7, 15, Colors.grey.withOpacity(0.1)),
                ],
                borderRadius: BorderRadius.zero)
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
                width: width,
                toY: 13,
                color: Colors.transparent,
                rodStackItems: [
                  BarChartRodStackItem(0, 7, const Color(0xff3c4bd0)),
                  BarChartRodStackItem(7, 13, Colors.grey.withOpacity(0.1)),
                ],
                borderRadius: BorderRadius.zero)
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
                width: width,
                toY: 10,
                color: Colors.transparent,
                rodStackItems: [
                  BarChartRodStackItem(0, 5, const Color(0xff3c4bd0)),
                  BarChartRodStackItem(5, 10, Colors.grey.withOpacity(0.1)),
                ],
                borderRadius: BorderRadius.zero)
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
                width: width,
                toY: 13,
                color: Colors.transparent,
                rodStackItems: [
                  BarChartRodStackItem(0, 7, const Color(0xff3c4bd0)),
                  BarChartRodStackItem(7, 13, Colors.grey.withOpacity(0.1)),
                ],
                borderRadius: BorderRadius.zero)
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 7,
          barRods: [
            BarChartRodData(
                width: width,
                toY: 5,
                color: Colors.transparent,
                rodStackItems: [
                  BarChartRodStackItem(0, 2, const Color(0xff3c4bd0)),
                  BarChartRodStackItem(2, 5, Colors.grey.withOpacity(0.1)),
                ],
                borderRadius: BorderRadius.zero)
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 8,
          barRods: [
            BarChartRodData(
                width: width,
                toY: 10,
                color: Colors.transparent,
                rodStackItems: [
                  BarChartRodStackItem(0, 5, const Color(0xff3c4bd0)),
                  BarChartRodStackItem(5, 10, Colors.grey.withOpacity(0.1)),
                ],
                borderRadius: BorderRadius.zero)
          ],
          showingTooltipIndicators: [0],
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
        child: const ColumnChart(),
      ),
    );
  }
}
