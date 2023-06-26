import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:admin_dashboard/proy/providers/movements_provider.dart';
import 'package:admin_dashboard/src/views/movements/movement_producto_details.dart';
import 'package:admin_dashboard/src/views/movements/movement_producto_image.dart';
import 'package:admin_dashboard/src/views/movements/movement_producto_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

class MovementsCardsView extends StatefulWidget {
  final List<Movimiento> movimientos;

  const MovementsCardsView({super.key, required this.movimientos});

  @override
  _MovementsCardsView createState() => _MovementsCardsView();
}

class _MovementsCardsView extends State<MovementsCardsView> {
  bool showMessage = false;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es');
    // Después de 5 segundos, si todavía no hay cotizaciones, muestra el mensaje
    Future.delayed(const Duration(seconds: 5), () {
      if (widget.movimientos.isEmpty) {
        if (mounted) {
          // Verificar si el widget todavía está montado
          setState(() {
            showMessage = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final movementsProvider = Provider.of<MovementsProvider>(context);
    final productEntries = movementsProvider.productEntries;
    final productExits = movementsProvider.productExits;

    if (productEntries.isEmpty && productExits.isEmpty) {
      if (showMessage) {
        return const Center(
          child: Text(
            'No existen cotizaciones, agrega una.',
          ),
        );
      } else {
        return const Center(
            child:
                CircularProgressIndicator(color: Colors.white, strokeWidth: 2));
      }
    }

    return RefreshIndicator(
      onRefresh: () async {
        await movementsProvider.getProductEntriesAndExits();
        setState(() {}); // Para reconstruir el widget.
      },
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemCount: productEntries.length,
        itemBuilder: (context, index) {
          final productId = productEntries.keys.elementAt(index);
          final productName =
              productEntries[productId]![0].stock.producto.nombre;
          final imageUrl = productEntries[productId]![0].stock.producto.img;

          int totalEntryBoxes = productEntries[productId]
                  ?.where((entry) => entry.verificacion == 'VERIFICADO')
                  .fold(0, (sum, entry) => sum! + entry.cantidadCajas) ??
              0;
          int totalEntryPieces = productEntries[productId]
                  ?.where((entry) => entry.verificacion == 'VERIFICADO')
                  .fold(0, (sum, entry) => sum! + entry.cantidadPiezas) ??
              0;

          int totalExitBoxes = productExits[productId]
                  ?.where((exit) => exit.verificacion == 'VERIFICADO')
                  .fold(0, (sum, exit) => sum! + exit.cantidadCajas) ??
              0;
          int totalExitPieces = productExits[productId]
                  ?.where((exit) => exit.verificacion == 'VERIFICADO')
                  .fold(0, (sum, exit) => sum! + exit.cantidadPiezas) ??
              0;

          return Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ProductImage(imageUrl: imageUrl!),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ProductInfo(
                          productName: productName,
                          totalEntryBoxes: totalEntryBoxes,
                          totalEntryPieces: totalEntryPieces,
                          totalExitBoxes: totalExitBoxes,
                          totalExitPieces: totalExitPieces,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ProductDetail(
                    productMovements: productEntries,
                    productId: productId,
                    title: 'Entradas',
                  ),
                  ProductDetail(
                    productMovements: productExits,
                    productId: productId,
                    title: 'Salidas',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
