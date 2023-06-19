import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

const gridColor = Color(0xff68739f);
const titleColor = Color(0xff8c95db);
const fashionColor = Color(0xffe15665);
const artColor = Color(0xff63e7e5);
const boxingColor = Color(0xff83dea7);
const entertainmentColor = Colors.white70;
const offRoadColor = Color(0xFFFFF59D);

class RadarChartSample1 extends StatefulWidget {
  const RadarChartSample1({Key? key}) : super(key: key);

  @override
  State<RadarChartSample1> createState() => _RadarChartSample1State();
}

class _RadarChartSample1State extends State<RadarChartSample1> {
  int selectedDataSetIndex = -1;
  double angleValue = 0;
  bool relativeAngleMode = true;

  @override
  Widget build(BuildContext context) {
    return RadarChart(
      RadarChartData(
        radarTouchData: RadarTouchData(
            touchCallback: (FlTouchEvent event, response) {
              if (!event.isInterestedForInteractions) {
                setState(() {
                  selectedDataSetIndex = -1;
                });
                return;
              }
              setState(() {
                selectedDataSetIndex =
                    response?.touchedSpot?.touchedDataSetIndex ?? -1;
              });
            }),
        dataSets: showingDataSets(),
        radarBackgroundColor: Colors.transparent,
        borderData: FlBorderData(show: false),
        radarBorderData: const BorderSide(color: Colors.transparent),
        titlePositionPercentageOffset: 0.2,
        titleTextStyle:
        const TextStyle(color: titleColor, fontSize: 15),
        tickCount: 1,
        ticksTextStyle:
        const TextStyle(color: Colors.transparent, fontSize: 12),
        tickBorderData: const BorderSide(color: Colors.transparent),
        gridBorderData: const BorderSide(color: gridColor, width: 2),
      ),
      swapAnimationDuration: const Duration(milliseconds: 400),
    );
  }

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      var index = entry.key;
      var rawDataSet = entry.value;

      final isSelected = index == selectedDataSetIndex
          ? true
          : selectedDataSetIndex == -1
          ? true
          : false;

      return RadarDataSet(
        fillColor: isSelected
            ? rawDataSet.color.withOpacity(0.2)
            : rawDataSet.color.withOpacity(0.05),
        borderColor:
        isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.25),
        entryRadius: isSelected ? 3 : 2,
        dataEntries:
        rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: isSelected ? 2.3 : 2,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets() {
    return [
      RawDataSet(
        title: 'Fashion',
        color: fashionColor,
        values: [
          300,
          50,
          250,
        ],
      ),
      RawDataSet(
        title: 'Art & Tech',
        color: artColor,
        values: [
          250,
          100,
          200,
        ],
      ),
      RawDataSet(
        title: 'Entertainment',
        color: entertainmentColor,
        values: [
          200,
          150,
          50,
        ],
      ),
      RawDataSet(
        title: 'Off-road Vehicle',
        color: offRoadColor,
        values: [
          150,
          200,
          150,
        ],
      ),
      RawDataSet(
        title: 'Boxing',
        color: boxingColor,
        values: [
          100,
          250,
          100,
        ],
      ),
    ];
  }
}

class RawDataSet {
  final String title;
  final Color color;
  final List<double> values;
  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });
}