import 'package:admin_dashboard/proy/models/dashboard.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/text.dart';
import 'package:admin_dashboard/src/views/charts/all_charts/AllMorrisChart/piechart3.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class MovementsReport extends StatefulWidget {
  final Dashboard dashboard;
  final String titulo;

  const MovementsReport(
      {Key? key, required this.dashboard, required this.titulo})
      : super(key: key);

  @override
  State<MovementsReport> createState() => _SalesReportState();
}

class _SalesReportState extends State<MovementsReport> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 465),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ConstText.lightText(
            text: widget.titulo,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          DateAndPrice(),
          FxBox.h40,
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 240,
            child: PieChartSample3(
              dashboard: widget.dashboard,
            ),
          ),
          FxBox.h48,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 8),
                  const Text('Entradas'),
                ],
              ),
              FxBox.w16,
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    color: Colors.yellow[800],
                  ),
                  const SizedBox(width: 8),
                  const Text('Salidas'),
                ],
              ),
              FxBox.w16,
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    color: const Color.fromARGB(255, 205, 57, 20),
                  ),
                  const SizedBox(width: 8),
                  const Text('Mermas'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DateAndPrice extends StatefulWidget {
  @override
  State<DateAndPrice> createState() => _DateAndPriceState();
}

class _DateAndPriceState extends State<DateAndPrice> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es_ES', null).then((_) {
      setState(() {
        // Ahora puedes usar DateFormat
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime oneMonthAgo = now.subtract(const Duration(days: 30));
    String formattedNow = DateFormat('MMMM dd', 'es_ES').format(now);
    String formattedOneMonthAgo =
        DateFormat('MMMM dd', 'es_ES').format(oneMonthAgo);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$formattedOneMonthAgo - $formattedNow',
          softWrap: true,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
