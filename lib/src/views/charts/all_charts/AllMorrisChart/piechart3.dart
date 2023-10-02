import 'package:admin_dashboard/proy/models/dashboard.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample3 extends StatefulWidget {
  final Dashboard dashboard;
  const PieChartSample3({Key? key, required this.dashboard}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample3> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: PieChart(
            PieChartData(
                pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                }),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 80,
                sections: showingSections()),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    Dashboard dashboard = widget.dashboard;

    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 26.0 : 17.0;
      final radius = isTouched ? 61.0 : 51.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 18, 187, 32),
            value: dashboard.porcentajeEntradas,
            title: '${dashboard.porcentajeEntradasFormateado}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: dashboard.porcentajeSalidas,
            title: '${dashboard.porcentajeSalidasFormateado}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color.fromARGB(255, 205, 57, 20),
            value: dashboard.porcentajeMermas,
            title: '${dashboard.porcentajeMermasFormateado}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );

        default:
          throw Error();
      }
    });
  }
}
