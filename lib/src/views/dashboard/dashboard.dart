import 'package:admin_dashboard/proy/providers/dashboard_provider.dart';
import 'package:admin_dashboard/src/views/dashboard/movements_report.dart';
import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/views/dashboard/list_item.dart';
import 'package:admin_dashboard/src/views/dashboard/montly_earning.dart';
import 'package:admin_dashboard/src/views/dashboard/sales_report.dart';
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
                                  Expanded(
                                    child: SalesReport(
                                      dashboard: dashboard,
                                      titulo: 'Estado de verificaciones',
                                    ),
                                  ),
                                  FxBox.w24,
                                  Expanded(
                                    child: MovementsReport(
                                      dashboard: dashboard,
                                      titulo: 'Estado de movimientos',
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  SalesReport(
                                    dashboard: dashboard,
                                    titulo: 'Estado de verificaciones',
                                  ),
                                  FxBox.h24,
                                  MovementsReport(
                                    dashboard: dashboard,
                                    titulo: 'Estado de movimientos',
                                  ),
                                ],
                              ),
                        FxBox.h24,
                        Responsive.isWeb(context)
                            ? Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                                child: TopProductSale(
                                              titulo: 'Producto más vendido',
                                              cantidad: dashboard
                                                  .productoMasVendidoCantidad
                                                  .toString(),
                                              producto:
                                                  dashboard.productoMasVendido,
                                              //
                                              descripcion:
                                                  'Producto más vendido en cajas el ultimo año',
                                            )),
                                            FxBox.w24,
                                            Expanded(
                                                child: TopProductSale(
                                              titulo: 'Producto menos vendido',
                                              cantidad: dashboard
                                                  .productoMenosVendidoCantidad
                                                  .toString(),
                                              producto: dashboard
                                                  .productoMenosVendido,
                                              descripcion:
                                                  'Producto menos vendido en cajas el ultimo año',
                                            )),
                                            FxBox.w24,
                                            Expanded(
                                                child: TopProductSale(
                                              titulo: 'Producto más rentable',
                                              cantidad: dashboard
                                                  .productoMasRentableMontoFormateado
                                                  .toString(),
                                              producto:
                                                  dashboard.productoMasRentable,
                                              descripcion:
                                                  'Monto vendido en bolivianos el ultimo año',
                                            )),
                                            FxBox.w24,
                                            Expanded(
                                                child: TopProductSale(
                                              titulo: 'Producto menos rentable',
                                              cantidad: dashboard
                                                  .productoMenosRentableMontoFormateado
                                                  .toString(),
                                              producto: dashboard
                                                  .productoMenosRentable,
                                              descripcion:
                                                  'Monto vendido en bolivianos el ultimo año',
                                            )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  Responsive.isTablet(context)
                                      ? Row(
                                          children: [
                                            Expanded(
                                                child: TopProductSale(
                                              titulo: 'Producto más vendido',
                                              cantidad: dashboard
                                                  .productoMasVendidoCantidad
                                                  .toString(),
                                              producto:
                                                  dashboard.productoMasVendido,
                                              descripcion:
                                                  'Producto más vendido en cajas el ultimo año',
                                            )),
                                            FxBox.w24,
                                            Expanded(
                                                child: TopProductSale(
                                              titulo: 'Producto menos vendido',
                                              cantidad: dashboard
                                                  .productoMenosVendidoCantidad
                                                  .toString(),
                                              producto: dashboard
                                                  .productoMenosVendido,
                                              descripcion:
                                                  'Producto menos vendido en cajas el ultimo año',
                                            )),
                                            FxBox.w24,
                                            Expanded(
                                                child: TopProductSale(
                                              titulo: 'Producto más rentable',
                                              cantidad: dashboard
                                                  .productoMasRentableMontoFormateado
                                                  .toString(),
                                              producto:
                                                  dashboard.productoMasRentable,
                                              descripcion:
                                                  'Monto vendido en bolivianos el ultimo año',
                                            )),
                                            FxBox.w24,
                                            Expanded(
                                                child: TopProductSale(
                                              titulo: 'Producto menos rentable',
                                              cantidad: dashboard
                                                  .productoMenosRentableMontoFormateado
                                                  .toString(),
                                              producto: dashboard
                                                  .productoMenosRentable,
                                              descripcion:
                                                  'Monto vendido en bolivianos el ultimo año',
                                            )),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            TopProductSale(
                                              titulo: 'Producto más vendido',
                                              cantidad: dashboard
                                                  .productoMasVendidoCantidad
                                                  .toString(),
                                              producto:
                                                  dashboard.productoMasVendido,
                                              descripcion:
                                                  'Producto más vendido en cajas el ultimo año',
                                            ),
                                            FxBox.h24,
                                            TopProductSale(
                                              titulo: 'Producto menos vendido',
                                              cantidad: dashboard
                                                  .productoMenosVendidoCantidad
                                                  .toString(),
                                              producto: dashboard
                                                  .productoMenosVendido,
                                              descripcion:
                                                  'Producto menos vendido en cajas el ultimo año',
                                            ),
                                            FxBox.h24,
                                            TopProductSale(
                                              titulo: 'Producto más rentable',
                                              cantidad: dashboard
                                                  .productoMasRentableMontoFormateado
                                                  .toString(),
                                              producto:
                                                  dashboard.productoMasRentable,
                                              descripcion:
                                                  'Monto vendido en bolivianos el ultimo año',
                                            ),
                                            FxBox.h24,
                                            TopProductSale(
                                              titulo: 'Producto menos rentable',
                                              cantidad: dashboard
                                                  .productoMenosRentableMontoFormateado
                                                  .toString(),
                                              producto: dashboard
                                                  .productoMenosRentable,
                                              descripcion:
                                                  'Monto vendido en bolivianos el ultimo año',
                                            ),
                                          ],
                                        ),
                                ],
                              ),
                        FxBox.h24,
                        Transaction(
                          dashboard: dashboard,
                        ),
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
