import 'package:admin_dashboard/proy/providers/auth_provider.dart';
import 'package:admin_dashboard/proy/providers/dashboard_provider.dart';
import 'package:admin_dashboard/proy/services/navigation_service.dart';
import 'package:admin_dashboard/proy/utils/menu_data.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/image.dart';
import 'package:admin_dashboard/src/constant/string.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/views/dashboard/movements_report.dart';
import 'package:admin_dashboard/src/views/dashboard/notification.dart';
import 'package:admin_dashboard/src/views/dashboard/top_product_sale_card.dart';
import 'package:admin_dashboard/src/views/user/user_profile.dart';
import 'package:admin_dashboard/src/views/users/users_page.dart';
import 'package:admin_dashboard/src/views/users/userview_test.dart';
import 'package:admin_dashboard/src/widget/administration_top_menus.dart';
import 'package:admin_dashboard/src/widget/dashboard_shimmer.dart';
import 'package:admin_dashboard/src/widget/order_history_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:admin_dashboard/src/views/dashboard/list_item.dart';
import 'package:admin_dashboard/src/views/dashboard/montly_earning.dart';
import 'package:admin_dashboard/src/views/dashboard/sales_report.dart';
import 'package:admin_dashboard/src/views/dashboard/top_producr_sales_box.dart';
import 'package:admin_dashboard/src/views/dashboard/transaction.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  List<int> codigosSucursal = []; // Lista de códigos de sucursal únicos
  Map<int, String> codigoToMunicipio = {}; // Mapa de código a municipio
  List<Map<String, dynamic>> listTab = [];
  Map<String, dynamic>? selectedTab;

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
      for (var i = 0; i < dashboards.length; i++) {
        var dashboard = dashboards[i];
        tempMap[dashboard.sucursal.codigoSucursal] =
            dashboard.sucursal.municipio;
        setState(() {
          listTab
              .add({"codigo": dashboard.sucursal.codigoSucursal, "index": i});
        });
      }
      setState(() {
        selectedTab = listTab[0];
        codigosSucursal = uniqueCodigos.toList();
        codigoToMunicipio = tempMap;
        // tabController = TabController(
        //     initialIndex: currentIndex,
        //     length: codigosSucursal.length,
        //     vsync: this);
        // if (tabController != null) {
        //   tabController!.addListener(() {
        //     setState(() {
        //       currentIndex = tabController!.index;
        //     });
        //   });
        // }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final userFormProvider = Provider.of<AuthProvider>(context);
    final dash = Provider.of<DashboardProvider>(context).dashboards;
    final user = userFormProvider.user!;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: selectedTab != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FxBox.h48,
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorConst.blue,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 2),
                                    color: Colors.black.withOpacity(.12),
                                    blurRadius: 12,
                                  )
                                ],
                                image: user.img != null
                                    ? DecorationImage(
                                        image:
                                            NetworkImage(user.img.toString()))
                                    : const DecorationImage(
                                        image:
                                            AssetImage('assets/no-image.jpg'))),
                          ),
                          Image(
                            image: const AssetImage(
                              Images.lgLightLogo,
                            ),
                            width: MediaQuery.of(context).size.width / 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationPage()));
                            },
                            child: const Icon(
                              EneftyIcons.notification_outline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const AdministrationTopMenus(),
                    Column(
                      children: [
                        FxBox.h24,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: listTab.map((e) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedTab = e;
                                    // currentIndex = e['index'];
                                  });
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: selectedTab == e
                                        ? ColorConst.blue.withOpacity(.16)
                                        : null,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: selectedTab == e
                                          ? ColorConst.blue
                                          : Colors.grey,
                                    ),
                                  ),
                                  child: Text(
                                    "${codigoToMunicipio[e['codigo']]} ${e['codigo']}",
                                    style: TextStyle(
                                        color: selectedTab == e
                                            ? ColorConst.blue
                                            : Colors.grey,
                                        fontWeight: selectedTab == e
                                            ? FontWeight.bold
                                            : null),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        Column(
                          children: [
                            Listitem(
                              dashboard: dash.firstWhere((d) =>
                                  d.sucursal.codigoSucursal ==
                                  selectedTab!['codigo']),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              child: Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                children: [
                                  TopProductSaleCard(
                                      descripcionBold: ' el ultimo año',
                                      descripcionRegular:
                                          'Producto más vendido en cajas',
                                      colorIcon: ColorConst.blue,
                                      productoMasVendido: dash
                                          .firstWhere((d) =>
                                              d.sucursal.codigoSucursal ==
                                              selectedTab!['codigo'])
                                          .productoMasVendidoCantidad
                                          .toString(),
                                      productoMasVendidoCantidad: dash
                                          .firstWhere((d) =>
                                              d.sucursal.codigoSucursal ==
                                              selectedTab!['codigo'])
                                          .productoMasVendido),
                                  TopProductSaleCard(
                                    descripcionBold: ' el ultimo año',
                                    descripcionRegular:
                                        'Producto menos vendido en cajas ',
                                    colorIcon: ColorConst.success,
                                    productoMasVendido: dash
                                        .firstWhere((d) =>
                                            d.sucursal.codigoSucursal ==
                                            selectedTab!['codigo'])
                                        .productoMenosVendidoCantidad
                                        .toString(),
                                    productoMasVendidoCantidad: dash
                                        .firstWhere((d) =>
                                            d.sucursal.codigoSucursal ==
                                            selectedTab!['codigo'])
                                        .productoMenosVendido,
                                  ),
                                  TopProductSaleCard(
                                    descripcionBold: ' el ultimo año',
                                    descripcionRegular:
                                        'Monto vendido en bolivianos',
                                    colorIcon: ColorConst.error,
                                    productoMasVendido: dash
                                        .firstWhere((d) =>
                                            d.sucursal.codigoSucursal ==
                                            selectedTab!['codigo'])
                                        .productoMasRentableMontoFormateado
                                        .toString(),
                                    productoMasVendidoCantidad: dash
                                        .firstWhere((d) =>
                                            d.sucursal.codigoSucursal ==
                                            selectedTab!['codigo'])
                                        .productoMasRentable,
                                  ),
                                  TopProductSaleCard(
                                    descripcionBold: ' el ultimo año',
                                    descripcionRegular:
                                        'Monto vendido en bolivianos',
                                    colorIcon: ColorConst.warning,
                                    productoMasVendido: dash
                                        .firstWhere((d) =>
                                            d.sucursal.codigoSucursal ==
                                            selectedTab!['codigo'])
                                        .productoMenosRentableMontoFormateado
                                        .toString(),
                                    productoMasVendidoCantidad: dash
                                        .firstWhere((d) =>
                                            d.sucursal.codigoSucursal ==
                                            selectedTab!['codigo'])
                                        .productoMenosRentable,
                                  ),
                                ],
                              ),
                            ),
                            FxBox.h24,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                FxBox.w16,
                                const Text(
                                  "Latest Order",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: ColorConst.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            FxBox.h4,
                            if (dash
                                .firstWhere((d) =>
                                    d.sucursal.codigoSucursal ==
                                    selectedTab!['codigo'])
                                .movimientosRecientes
                                .isNotEmpty)
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: dash
                                      .firstWhere((d) =>
                                          d.sucursal.codigoSucursal ==
                                          selectedTab!['codigo'])
                                      .movimientosRecientes
                                      .map((e) {
                                    return OrderHistoryCard(e: e);
                                  }).toList(),
                                ),
                              ),
                            FxBox.h24,
                            Monthlyearning(
                              dashboard: dash.firstWhere((d) =>
                                  d.sucursal.codigoSucursal ==
                                  selectedTab!['codigo']),
                            ),
                            Responsive.isWeb(context)
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SalesReport(
                                          dashboard: dash.firstWhere((d) =>
                                              d.sucursal.codigoSucursal ==
                                              selectedTab!['codigo']),
                                          titulo: 'Estado de verificaciones',
                                        ),
                                      ),
                                      FxBox.w24,
                                      Expanded(
                                        child: MovementsReport(
                                          dashboard: dash.firstWhere((d) =>
                                              d.sucursal.codigoSucursal ==
                                              selectedTab!['codigo']),
                                          titulo: 'Estado de movimientos',
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      SalesReport(
                                        dashboard: dash.firstWhere((d) =>
                                            d.sucursal.codigoSucursal ==
                                            selectedTab!['codigo']),
                                        titulo: 'Estado de verificaciones',
                                      ),
                                      FxBox.h24,
                                      MovementsReport(
                                        dashboard: dash.firstWhere((d) =>
                                            d.sucursal.codigoSucursal ==
                                            selectedTab!['codigo']),
                                        titulo: 'Estado de movimientos',
                                      ),
                                    ],
                                  ),
                            FxBox.h24,
                          ],
                        ),
                        FxBox.h64,
                        FxBox.h64,
                      ],
                    ),
                  ],
                )
              : const DashboardShimmer()),
    );

    return DefaultTabController(
      length: codigosSucursal.length,
      child: SizedBox(
        height: size.height - 210,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: null,
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
