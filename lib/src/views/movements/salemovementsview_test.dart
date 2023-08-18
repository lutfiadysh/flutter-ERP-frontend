import 'package:admin_dashboard/proy/providers/movements_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaleMovementsView extends StatefulWidget {
  final String saleId;

  SaleMovementsView({required this.saleId});

  @override
  State<SaleMovementsView> createState() => _SaleMovementsViewState();
}

class _SaleMovementsViewState extends State<SaleMovementsView> {
  Future? getMovementsFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getMovementsFuture = Provider.of<MovementsProvider>(context, listen: false)
        .getMovementsBySale(widget.saleId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movimientos de la Venta ${widget.saleId}"),
      ),
      body: FutureBuilder(
        future: getMovementsFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('An error occurred!'));
          } else {
            final movementsProvider = Provider.of<MovementsProvider>(context);
            final movimientosPorVenta = movementsProvider.movimientosPorVenta;

            return movimientosPorVenta.isEmpty
                ? const Center(
                    child: Text("No hay movimientos para esta venta."))
                : ListView.builder(
                    itemCount: movimientosPorVenta.length,
                    itemBuilder: (context, index) {
                      final movimiento = movimientosPorVenta[index];
                      // Aquí puedes personalizar cómo quieres mostrar cada movimiento
                      return ListTile(
                        title: Text(movimiento.stock.producto.nombre),
                        // ... otros detalles del movimiento ...
                      );
                    },
                  );
          }
        },
      ),
    );
  }
}
