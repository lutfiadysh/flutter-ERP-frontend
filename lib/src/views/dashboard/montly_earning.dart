import 'package:admin_dashboard/proy/models/dashboard.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/text.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/widget/half_chart.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutterx/flutterx.dart';

class Monthlyearning extends StatefulWidget {
  final Dashboard dashboard;
  final Color barColor;
  final TextStyle titleStyle;

  Monthlyearning({
    this.barColor = const Color(0xff37a499),
    this.titleStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    required this.dashboard,
  });

  @override
  State<Monthlyearning> createState() => _MonthlyEarningsState();
}

class _MonthlyEarningsState extends State<Monthlyearning> {
  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> barGroups = [];
    double maxY = 0;

// Obtener todas las estadísticas mensuales
    var todasEstadisticas = widget.dashboard.montoVentasPorMesAnual;

// Si no es web, tomar solo las últimas 10 estadísticas
    if (Responsive.isMobile(context)) {
      if (todasEstadisticas.length > 10) {
        todasEstadisticas =
            todasEstadisticas.sublist(todasEstadisticas.length - 10);
      }
    }

    for (var estadistica in todasEstadisticas) {
      maxY = max(maxY, estadistica.total.toDouble());
      barGroups.add(
        BarChartGroupData(
          x: estadistica.month,
          barRods: [
            BarChartRodData(
              toY: estadistica.total.toDouble(),
              width: 16,
              borderRadius: BorderRadius.zero,
              color: widget.barColor,
            ),
          ],
        ),
      );
    }

    if (barGroups.isEmpty) {
      return const Text("No hay datos disponibles");
    }

    double calculatedMaxY = maxY + maxY * 0.1;
    double roundedMaxY;

    if (calculatedMaxY % 1000 != 0) {
      roundedMaxY = (calculatedMaxY / 1000).floor() * 1000.0;
    } else {
      roundedMaxY = calculatedMaxY;
    }

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: Responsive.isMobile(context) ? 1265 : 455),
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstText.lightText(
                text: "Ventas mensuales",
                fontWeight: FontWeight.bold,
              ),
              FxBox.h24,
              Responsive.isMobile(context)
                  ? Expanded(
                      child: Column(
                      children: [
                        Expanded(
                          child: VentasMensuales(
                              roundedMaxY: roundedMaxY, barGroups: barGroups),
                        ),
                        FxBox.h16,
                        const Divider(),
                        FxBox.h16,
                        Expanded(
                          child: _monthEarning(
                            durationText: 'Meta de ventas anual',
                            salesAmount:
                                'Bs. ${widget.dashboard.metasDeVentas.montoMetaVentasAnualFormateado}',
                            salesTotal: widget.dashboard.montoVentasAnual,
                            salesGoal: widget.dashboard.metasDeVentas.anual,
                            descriptionText:
                                'Ventas alcanzadas el año anterior',
                          ),
                        ),
                        FxBox.h16,
                        Expanded(
                          child: _monthEarning(
                            durationText: 'Meta de ventas mensual',
                            salesAmount:
                                'Bs. ${widget.dashboard.metasDeVentas.montoMetaVentasMensualFormateado}',
                            salesGoal: widget.dashboard.metasDeVentas.mensual,
                            salesTotal: widget.dashboard.montoVentasMensual,
                            descriptionText:
                                'Ventas alcanzadas el mes anterior',
                          ),
                        ),
                        FxBox.h16,
                        Expanded(
                          child: _monthEarning(
                            durationText: 'Meta de ventas diario',
                            salesAmount:
                                'Bs. ${widget.dashboard.metasDeVentas.montoMetaVentasDiarioFormateado}',
                            salesGoal: widget.dashboard.metasDeVentas.diario,
                            salesTotal: widget.dashboard.montoVentasDiario,
                            descriptionText: 'Ventas alcanzadas ayer',
                          ),
                        ),
                      ],
                    ))
                  : Expanded(
                      child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: VentasMensuales(
                              roundedMaxY: roundedMaxY, barGroups: barGroups),
                        ),
                        FxBox.h16,
                        Expanded(
                          child: _monthEarning(
                            durationText: 'Meta de ventas anual',
                            salesAmount:
                                'Bs. ${widget.dashboard.metasDeVentas.montoMetaVentasAnualFormateado}',
                            salesTotal: widget.dashboard.montoVentasAnual,
                            salesGoal: widget.dashboard.metasDeVentas.anual,
                            descriptionText:
                                'Ventas alcanzadas el año anterior',
                          ),
                        ),
                        FxBox.h16,
                        Expanded(
                          child: _monthEarning(
                            durationText: 'Meta de ventas mensual',
                            salesAmount:
                                'Bs. ${widget.dashboard.metasDeVentas.montoMetaVentasMensualFormateado}',
                            salesGoal: widget.dashboard.metasDeVentas.mensual,
                            salesTotal: widget.dashboard.montoVentasMensual,
                            descriptionText:
                                'Ventas alcanzadas el mes anterior',
                          ),
                        ),
                        FxBox.h16,
                        Expanded(
                          child: _monthEarning(
                            durationText: 'Meta de ventas diario',
                            salesAmount:
                                'Bs. ${widget.dashboard.metasDeVentas.montoMetaVentasDiarioFormateado}',
                            salesGoal: widget.dashboard.metasDeVentas.diario,
                            salesTotal: widget.dashboard.montoVentasDiario,
                            descriptionText: 'Ventas alcanzadas ayer',
                          ),
                        ),
                      ],
                    ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _monthEarning({
    required String durationText,
    required String salesAmount,
    required String descriptionText,
    required double salesTotal,
    required double salesGoal,
  }) {
    final screenwidth = MediaQuery.of(context).size.width - 48;
    final radius = (screenwidth / 4) - 8;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstText.lightText(
          textAlign: TextAlign.start,
          text: durationText,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        Responsive.isMobile(context) ? FxBox.h8 : FxBox.h28,
        ConstText.largeText(
          text: salesAmount,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),

        Responsive.isMobile(context) ? FxBox.h16 : FxBox.h28,
        // _circularProgress(),
        _halfCircleChart(
          radius: radius >= 77 ? 77 : radius,
          chartColor: ColorConst.primary,
          chartpercentage: (salesGoal == 0.0) ? 0.0 : salesTotal / salesGoal,
        ),
        ConstText.lightText(
          textAlign: TextAlign.center,
          text: descriptionText,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        Divider(
          color: Colors.grey[300],
        ),
      ],
    );
  }

  Widget _halfCircleChart({
    required double chartpercentage,
    required Color chartColor,
    required double radius,
  }) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircularPercentIndicator(
            radius: radius,
            lineWidth: 15,
            percent: 1,
            progressColor: ColorConst.drawerBG,
            circularStrokeCap: CircularStrokeCap.square,
            arcType: ArcType.HALF,
          ),
          CircularPercentIndicator(
            radius: 77,
            lineWidth: 15,
            percent: chartpercentage,
            backgroundColor: ColorConst.white,
            progressColor: chartColor,
            circularStrokeCap: CircularStrokeCap.square,
            arcType: ArcType.HALF,
          ),
        ],
      ),
    );
  }
}

class VentasMensuales extends StatelessWidget {
  const VentasMensuales({
    super.key,
    required this.roundedMaxY,
    required this.barGroups,
  });

  final double roundedMaxY;
  final List<BarChartGroupData> barGroups;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: roundedMaxY,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueAccent,
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
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getTitles,
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: const Color(0xff37434d),
            width: 1,
          ),
        ),
        barGroups: barGroups,
      ),
    );
  }
}

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
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
    case 8:
      text = 'Sep';
      break;
    case 9:
      text = 'Oct';
      break;
    case 10:
      text = 'Nov';
      break;
    default:
      text = 'Dec';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4.0,
    child: Text(text, style: style),
  );
}
