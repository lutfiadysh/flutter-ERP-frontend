import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:flutterx/flutterx.dart';

class BarChartSample2 extends StatefulWidget {
  const BarChartSample2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final Color leftBarColor = const Color(0xFF2161a2);
  final Color rightBarColor = ColorConst.chartColorGreen;
  final double width = 15;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(
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
                ),
                maxY: 20,
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
                      getTitlesWidget: bottomTitles,
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
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: showingBarGroups,
                gridData: FlGridData(show: false),
              ),
            ),
          ),
          FxBox.h12
        ],
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    TextStyle style;
    style = TextStyle(
      color: ColorConst.gridTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    String text;
    if (value == 0) {
      text = '0';
    } else if (value == 5) {
      text = '25';
    } else if (value == 10) {
      text = '50';
    } else if (value == 15) {
      text = '75';
    } else if (value == 19) {
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

  Widget bottomTitles(double value, TitleMeta meta) {
    List<String> titles = [
      "2016",
      "2017",
      "2018",
      "2019",
      "2020",
      "2021",
      "2022"
    ];
    Widget text = Text(
      titles[value.toInt()],
      style: TextStyle(
        color: ColorConst.gridTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 12, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        toY: y1,
        color: leftBarColor,
        width: width,
        borderRadius: BorderRadius.zero,
      ),
      BarChartRodData(
        toY: y2,
        color: rightBarColor,
        width: width,
        borderRadius: BorderRadius.zero,
      ),
    ]);
  }
}
