import 'package:admin_dashboard/src/constant/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnimatingPieChart extends StatefulWidget {
  const AnimatingPieChart({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: PieChart(
            PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 80,
                sections: showingSections()),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(7, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            showTitle: true,
            color: ColorConst.primary,
            value: 4,
            title: '40%',
            radius: radius,
            titleStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: ColorConst.primary),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xff37a499),
            value: 10,
            radius: radius,
            titleStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff37a499)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xfff8b427),
            value: 40,
            radius: radius,
            titleStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xfff8b427)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff333a3f),
            value: 10,
            radius: radius,
            titleStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff333a3f)),
          );
        case 4:
          return PieChartSectionData(
            color: const Color(0xff38a5f3),
            value: 15,
            radius: radius,
            titleStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xff38a5f3)),
          );
        case 5:
          return PieChartSectionData(
            color: const Color(0xffeb4660),
            radius: radius,
            value: 10,
            titleStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xffeb4660)),
          );
        case 6:
          return PieChartSectionData(
            color: const Color(0xfff7f9fa),
            radius: radius,
          );
        default:
          throw Error();
      }
    });
  }
}
