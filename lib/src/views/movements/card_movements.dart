import 'package:admin_dashboard/proy/providers/orders_provider.dart';
import 'package:admin_dashboard/proy/providers/sales_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/theme.dart';
import 'package:admin_dashboard/src/views/movements/card_ordersmovements.dart';
import 'package:admin_dashboard/src/views/movements/card_salemovements.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:admin_dashboard/proy/providers/movements_provider.dart';
import 'package:provider/provider.dart';
import 'verification_customDialog.dart';

class CardSaleMovements extends StatefulWidget {
  final List<Movimiento> movimientos;

  const CardSaleMovements({Key? key, required this.movimientos})
      : super(key: key);

  @override
  State<CardSaleMovements> createState() => _CardSaleMovementsState();
}

class _CardSaleMovementsState extends State<CardSaleMovements> {
  bool showMessage = false;

  @override
  void initState() {
    super.initState();
    fetchMovements();
    Provider.of<SalesProvider>(context, listen: false).getSales();
    Provider.of<OrdersProvider>(context, listen: false).getOrders();
  }

  Future<void> fetchMovements() async {
    await Provider.of<MovementsProvider>(context, listen: false).getMovements();

    Future.delayed(const Duration(seconds: 5), () {
      if (widget.movimientos.isEmpty) {
        setState(() {
          showMessage = true;
        });
      }
    });
  }

  List<Movimiento> filterMovementsByType(String type,
      {String? verificationStatus}) {
    return widget.movimientos
        .where((movimiento) =>
            movimiento.movimiento == type &&
            (verificationStatus == null ||
                movimiento.verificacion == verificationStatus))
        .toList();
  }

  List<Movimiento> filterMovementsByVerificationStatus(
      String verificationStatus) {
    return widget.movimientos
        .where((movimiento) => movimiento.verificacion == verificationStatus)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final ventas = Provider.of<SalesProvider>(context).ventas;

    final pedidtos = Provider.of<OrdersProvider>(context).pedidos;

    if (widget.movimientos.isEmpty) {
      if (showMessage) {
        return const Center(
          child: Text(
            'No existen movimientos, agrega uno.',
          ),
        );
      } else {
        return const Center(
            child:
                CircularProgressIndicator(color: Colors.white, strokeWidth: 2));
      }
    }

    return DefaultTabController(
      length: 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            unselectedLabelColor: isDark ? ColorConst.white : ColorConst.black,
            labelColor: Theme.of(context).colorScheme.primary,
            indicatorColor: Theme.of(context).colorScheme.primary,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4,
            isScrollable: true,
            tabs: const [
              Tab(text: 'Movimientos'),
              Tab(text: 'Entradas'),
              Tab(text: 'Salidas'),
              Tab(text: 'Verificados'),
              Tab(text: 'Ventas'),
              Tab(text: 'Pedidos')
              //Tab(text: 'Traspasos'),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              children: [
                buildList(filterMovementsByVerificationStatus('EN ESPERA'),
                    showMovementType: true),
                buildList(filterMovementsByType('ENTRADA',
                    verificationStatus: 'EN ESPERA')),
                buildList(filterMovementsByType('SALIDA',
                    verificationStatus: 'EN ESPERA')),
                buildList(filterMovementsByVerificationStatus('VERIFICADO')),
                CardSalesMovements(
                  ventas: ventas,
                ),
                CardOrdersMovements(
                  pedidos: pedidtos,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VerificationBadge extends StatelessWidget {
  final String verificationStatus;

  const VerificationBadge({Key? key, required this.verificationStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color badgeColor;
    switch (verificationStatus) {
      case 'EN ESPERA':
        badgeColor = ColorConst.warning;
        break;
      case 'VERIFICADO':
        badgeColor = ColorConst.success;
        break;
      case 'ERROR':
        badgeColor = ColorConst.error;
        break;
      default:
        badgeColor = ColorConst.primary;
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        verificationStatus,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class VerificationImage extends StatelessWidget {
  final String? imageUrl;

  const VerificationImage({
    Key? key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: imageUrl == null
          ? Image.asset(
              'assets/no-image.jpg',
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            )
          : FadeInImage.assetNetwork(
              placeholder: 'assets/loader.gif',
              image: imageUrl!,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
    );

    return SizedBox(
      width: 100,
      height: 100,
      child: image,
    );
  }
}

String timeAgo(DateTime date) {
  final now = DateTime.now();
  final difference = now.difference(date);
  if (difference.inDays > 0) {
    return '${difference.inDays} días atrás';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} horas atrás';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minutos atrás';
  } else {
    return 'hace un momento';
  }
}

Widget buildList(List<Movimiento> filteredMovements,
    {bool showMovementType = false}) {
  return ListView.builder(
    itemCount: filteredMovements.length,
    itemBuilder: (context, index) {
      final movimiento = filteredMovements[index];

      return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return MovementDetailsDialog(movimiento: movimiento);
            },
          );
        },
        child: Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    VerificationImage(
                      imageUrl: movimiento.stock.producto.img,
                    ),
                    const SizedBox(height: 8),
                    VerificationBadge(
                      verificationStatus: movimiento.verificacion,
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movimiento.stock.producto.nombre,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      if (showMovementType)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            'Movimiento: ${movimiento.movimiento}',
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      const SizedBox(height: 8),
                      Text(
                        'Sucursal: ${movimiento.stock.sucursal.municipio}',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Cantidad de cajas: ${movimiento.cantidadCajas}',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Cantidad de piezas: ${movimiento.cantidadPiezas}',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Creado: ${timeAgo(movimiento.fecha)}',
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
        ),
      );
    },
  );
}
