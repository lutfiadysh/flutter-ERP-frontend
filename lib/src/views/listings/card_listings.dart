import 'package:admin_dashboard/proy/models/listing.dart';
import 'package:admin_dashboard/proy/providers/listings_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardsListingsViewTest extends StatefulWidget {
  final List<Cotizacion> cotizaciones;

  const CardsListingsViewTest({Key? key, required this.cotizaciones})
      : super(key: key);

  @override
  _CardListingsViewTestState createState() => _CardListingsViewTestState();
}

class _CardListingsViewTestState extends State<CardsListingsViewTest> {
  bool showMessage = false;

  @override
  void initState() {
    super.initState();
    // Después de 5 segundos, si todavía no hay cotizaciones, muestra el mensaje
    Future.delayed(const Duration(seconds: 5), () {
      if (widget.cotizaciones.isEmpty) {
        setState(() {
          showMessage = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final listingsProvider = Provider.of<ListingsProvider>(context);
    final cotizaciones = listingsProvider.cotizaciones;

    if (cotizaciones.isEmpty) {
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

    return ListView.separated(
      padding: const EdgeInsets.all(8.0),
      itemCount: cotizaciones.length,
      itemBuilder: (context, index) {
        final cotizacion = cotizaciones[index];
        final formattedDate = _formatDate(cotizacion.fecha);

        return Card(
          elevation: 2.0,
          child: ListTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cliente: ${cotizacion.cliente}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "Sucursal: ${cotizacion.sucursal.definicion}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "Fecha: $formattedDate",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "Estado: ${cotizacion.estado ? 'Activo' : 'Inactivo'}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "Total: ${cotizacion.total} Bs",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "Productos: ${cotizacion.productos.length}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            onTap: () {
              listingsProvider.selectCotizacion(cotizacion);
              AutoTabsRouter.of(context).setActiveIndex(45);
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}

String _formatDate(DateTime date) {
  var now = DateTime.now();
  var difference = now.difference(date);

  if (difference.inDays > 365) {
    int years = (difference.inDays / 365).floor();
    return "hace $years año${years == 1 ? '' : 's'}";
  } else if (difference.inDays > 30) {
    int months = (difference.inDays / 30).floor();
    return "hace $months mes${months == 1 ? '' : 'es'}";
  } else {
    if (difference.inDays > 0) {
      return "hace ${difference.inDays} día${difference.inDays == 1 ? '' : 's'}";
    } else if (difference.inHours > 0) {
      return "hace ${difference.inHours} hora${difference.inHours == 1 ? '' : 's'}";
    } else {
      return "hace ${difference.inMinutes} minuto${difference.inMinutes == 1 ? '' : 's'}";
    }
  }
}
