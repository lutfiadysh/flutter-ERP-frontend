import 'package:admin_dashboard/proy/providers/dashboard_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/views/dashboard/activity.dart';
import 'package:admin_dashboard/src/views/dashboard/chat_screen.dart';
import 'package:admin_dashboard/src/views/dashboard/client_review.dart';
import 'package:admin_dashboard/src/views/dashboard/list_item.dart';
import 'package:admin_dashboard/src/views/dashboard/montly_earning.dart';
import 'package:admin_dashboard/src/views/dashboard/sales_analytics.dart';
import 'package:admin_dashboard/src/views/dashboard/sales_report.dart';
import 'package:admin_dashboard/src/views/dashboard/status_box.dart';
import 'package:admin_dashboard/src/views/dashboard/top_producr_sales_box.dart';
import 'package:admin_dashboard/src/views/dashboard/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';

@RoutePage()
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<int> codigosSucursal = []; // Lista de códigos de sucursal únicos
  Map<int, String> codigoToMunicipio = {}; // Mapa de código a municipio

  @override
  void initState() {
    super.initState();

    // Obtener los dashboards y actualizar la lista de códigos de sucursal
    Provider.of<DashboardProvider>(context, listen: false)
        .getDashboards()
        .then((_) {
      final dashboards =
          Provider.of<DashboardProvider>(context, listen: false).dashboards;
      final Set<int> uniqueCodigos = dashboards
          .map((dashboard) => dashboard.sucursal.codigoSucursal)
          .toSet();
      final Map<int, String> tempMap = {};
      for (var dashboard in dashboards) {
        tempMap[dashboard.sucursal.codigoSucursal] =
            dashboard.sucursal.municipio;
      }
      setState(() {
        codigosSucursal = uniqueCodigos.toList();
        codigoToMunicipio = tempMap;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: codigosSucursal.length,
      child: SizedBox(
        height: size.height - 210,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Dashboard'),
            bottom: TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              tabs: codigosSucursal.map((int codigo) {
                return Tab(
                    text:
                        '${codigoToMunicipio[codigo] ?? 'Desconocido'} ($codigo)');
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: codigosSucursal.map((int codigo) {
              final dashboard = Provider.of<DashboardProvider>(context)
                  .dashboards
                  .firstWhere((d) => d.sucursal.codigoSucursal == codigo);

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        FxBox.h24,
                        Listitem(
                          dashboard: dashboard,
                        ),
                        FxBox.h24,
                        Monthlyearning(
                          dashboard: dashboard,
                        ),
                        FxBox.h24,
                        Responsive.isWeb(context)
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Expanded(
                                    child: SalesReport(),
                                  ),
                                  FxBox.w24,
                                  const Expanded(
                                    child: Salesanalytics(),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  const SalesReport(),
                                  FxBox.h24,
                                  const Salesanalytics(),
                                ],
                              ),
                        FxBox.h24,
                        Responsive.isWeb(context)
                            ? Row(
                                children: [
                                  const Expanded(
                                    child: Chatscreen(),
                                  ),
                                  FxBox.w24,
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            const Expanded(child: StatusBox()),
                                            FxBox.w24,
                                            const Expanded(
                                                child: TopProductSale()),
                                          ],
                                        ),
                                        FxBox.h24,
                                        const Clienresponse(),
                                      ],
                                    ),
                                  ),
                                  FxBox.w24,
                                  const Expanded(
                                    child: Activity(),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  const Chatscreen(),
                                  FxBox.h24,
                                  Responsive.isTablet(context)
                                      ? Row(
                                          children: [
                                            const Expanded(child: StatusBox()),
                                            FxBox.w24,
                                            const Expanded(
                                                child: TopProductSale()),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            const StatusBox(),
                                            FxBox.h24,
                                            const TopProductSale(),
                                          ],
                                        ),
                                  FxBox.h24,
                                  const Clienresponse(),
                                  FxBox.h24,
                                  const Activity(),
                                ],
                              ),
                        FxBox.h24,
                        const Transaction(),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
