import 'package:admin_dashboard/proy/providers/movements_provider.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/views/movements/card_movements.dart';
import 'package:admin_dashboard/src/views/movements/verification_customDialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderMovementsView extends StatefulWidget {
  final String orderID;

  OrderMovementsView({required this.orderID});

  @override
  State<OrderMovementsView> createState() => _SaleMovementsViewState();
}

class _SaleMovementsViewState extends State<OrderMovementsView> {
  Future? getMovementsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getMovementsFuture = Provider.of<MovementsProvider>(context, listen: false)
        .getMovementsByOrder(widget.orderID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movimientos del pedido"),
      ),
      body: FutureBuilder(
        future: getMovementsFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('An error occurred!'));
          } else {
            return Consumer<MovementsProvider>(
                builder: (context, movementsProvider, child) {
              final movimientosPorPedido =
                  movementsProvider.movimientosPorPedido;
              return movimientosPorPedido.isEmpty
                  ? const Center(
                      child: Text("No hay movimientos para esta venta."))
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                        itemCount: movimientosPorPedido.length,
                        itemBuilder: (context, index) {
                          final movimiento = movimientosPorPedido[index];

                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return MovementDetailsDialog(
                                      movimiento: movimiento);
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
                                          imageUrl:
                                              movimiento.stock.producto.img,
                                        ),
                                        const SizedBox(height: 8),
                                        VerificationBadge(
                                          verificationStatus:
                                              movimiento.verificacion,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movimiento.stock.producto.nombre,
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8),
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
                      ),
                    );
            });
          }
        },
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
