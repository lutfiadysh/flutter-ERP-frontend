import 'package:admin_dashboard/proy/models/sale.dart';
import 'package:flutter/material.dart';

class CardSales extends StatefulWidget {
  final List<Venta> ventas;

  const CardSales({super.key, required this.ventas});

  @override
  State<CardSales> createState() => _CardSalesState();
}

class _CardSalesState extends State<CardSales> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            // ExtendedNavigator.of(context).push(
            //   Routes.listingDetailsView,
            //   arguments: ListingDetailsViewArguments(
            //     listing: listings[index],
            //   ),
            // );
          },
          child: Card(
            elevation: 2.0,
            child: ListTile(
              title: Text(widget.ventas[index].id),
              subtitle: Text(widget.ventas[index].fechaVenta.toString()),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
            ),
          ),
        );
      },
      itemCount: widget.ventas.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}
