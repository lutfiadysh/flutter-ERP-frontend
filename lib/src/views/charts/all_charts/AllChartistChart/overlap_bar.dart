import 'package:admin_dashboard/src/constant/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OverlapBar extends StatefulWidget {
  const OverlapBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => OverlapBarState();
}

class OverlapBarState extends State<OverlapBar> {
  final Color leftBarColor = ColorConst.primary;
  final Color rightBarColor = const Color(0xff3da397);
  final double width = 12;

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
    final barGroup8 = makeGroupData(7, 17, 6);
    final barGroup9 = makeGroupData(8, 20, 16);
    final barGroup10 = makeGroupData(9, 16, 12);
    final barGroup11 = makeGroupData(10, 5, 12);
    final barGroup12 = makeGroupData(11, 18, 5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
      barGroup8,
      barGroup9,
      barGroup10,
      barGroup11,
      barGroup12,
    ];

    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
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
            groupsSpace: 100,
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
      const SizedBox(
        height: 12,
      ),
    ]);
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
    } else if (value == 3) {
      text = '1.2';
    } else if (value == 6) {
      text = '2.5';
    } else if (value == 9) {
      text = '3.7';
    } else if (value == 12) {
      text = '5.0';
    } else if (value == 15) {
      text = '6.2';
    } else if (value == 18) {
      text = '7.5';
    } else if (value == 20) {
      text = '9.0';
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
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "Mai",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 0, x: x, barRods: [
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
