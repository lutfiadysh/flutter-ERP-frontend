import 'dart:math';

import 'package:admin_dashboard/proy/models/stock.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardStocks extends StatefulWidget {
  final List<Stock> stocks;

  const CardStocks({Key? key, required this.stocks}) : super(key: key);

  @override
  _CardStocksState createState() => _CardStocksState();
}

class _CardStocksState extends State<CardStocks> {
  @override
  void initState() {
    super.initState();
    Provider.of<StocksProvider>(context, listen: false).getStocks();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.stocks.length,
      itemBuilder: (context, index) {
        final stock = widget.stocks[index];

        final image = ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: stock.producto.img == null
              ? Image.asset(
                  'assets/no-image.jpg',
                  fit: BoxFit.cover,
                  width: 130,
                  height: 130,
                )
              : FadeInImage.assetNetwork(
                  placeholder: 'assets/loader.gif',
                  image: stock.producto.img!,
                  fit: BoxFit.cover,
                  width: 130,
                  height: 130,
                ),
        );

        return Center(
          child: SizedBox(
            child: Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  SizedBox(
                    width: 500,
                    child: Row(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          margin: const EdgeInsets.all(16),
                          child: image,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stock.producto.nombre,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                stock.producto.categoria.nombre,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Cajas: ${stock.cantidadCajas}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Piezas: ${stock.cantidadPiezas}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Cajas salientes: ${stock.reservadoCajas}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Piezas salientes: ${stock.reservadoPiezas}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Cajas entrantes: ${stock.entranteCajas}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Piezas entrantes: ${stock.entrantePiezas}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Punto de reorden: ${stock.puntoReorden}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Pedido EOQ: ${stock.eoq}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ExpansionTile(
                    title: const Text("Estadísticas"),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //texto alineado a la izquierda
                            const Text("Evolución temporal del stock",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(height: 20),
                            ReusableBarChart(stock: stock),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ReusableBarChart extends StatefulWidget {
  final Stock stock;
  final Color barColor;
  final TextStyle titleStyle;

  ReusableBarChart({
    required this.stock,
    this.barColor = const Color(0xff37a499),
    this.titleStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  });

  @override
  State<ReusableBarChart> createState() => _ReusableBarChartState();
}

class _ReusableBarChartState extends State<ReusableBarChart> {
  @override
  Widget build(BuildContext context) {
    List<BarChartGroupData> barGroups = [];
    double maxY = 0;

// Obtener todas las estadísticas mensuales
    var todasEstadisticas = widget.stock.estadisticasMensuales ?? [];

// Si no es web, tomar solo las últimas 10 estadísticas
    if (Responsive.isMobile(context)) {
      if (todasEstadisticas.length > 10) {
        todasEstadisticas =
            todasEstadisticas.sublist(todasEstadisticas.length - 10);
      }
    }

    for (var estadistica in todasEstadisticas) {
      maxY = max(maxY, estadistica.totalCajas.toDouble());
      barGroups.add(
        BarChartGroupData(
          x: estadistica.month,
          barRods: [
            BarChartRodData(
              toY: estadistica.totalCajas.toDouble(),
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
    double roundedMaxY = (calculatedMaxY % 10 != 0)
        ? calculatedMaxY + 10 - (calculatedMaxY % 10)
        : calculatedMaxY;

    return SizedBox(
      height: 300,
      child: BarChart(
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
