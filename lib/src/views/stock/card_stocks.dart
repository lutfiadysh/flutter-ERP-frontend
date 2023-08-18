import 'package:admin_dashboard/proy/models/stock.dart';
import 'package:admin_dashboard/proy/providers/stocks_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardStocks extends StatefulWidget {
  final List<Stock> stocks;

  const CardStocks({Key? key, required this.stocks}) : super(key: key);

  @override
  _CardStocksState createState() => _CardStocksState();
}

class _CardStocksState extends State<CardStocks> {
  @override
  void initState() {
    super.initState();
    Provider.of<StocksProvider>(context, listen: false).getStocks();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.stocks.length,
      itemBuilder: (context, index) {
        final stock = widget.stocks[index];

        final image = ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: stock.producto.img == null
              ? Image.asset(
                  'assets/no-image.jpg',
                  fit: BoxFit.cover,
                  width: 130,
                  height: 130,
                )
              : FadeInImage.assetNetwork(
                  placeholder: 'assets/loader.gif',
                  image: stock.producto.img!,
                  fit: BoxFit.cover,
                  width: 130,
                  height: 130,
                ),
        );

        return Center(
          child: SizedBox(
            child: Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: SizedBox(
                width: 500,
                child: Row(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      margin: const EdgeInsets.all(16),
                      child: image,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            stock.producto.nombre,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            stock.producto.categoria.nombre,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Cajas: ${stock.cantidadCajas}",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Piezas: ${stock.cantidadPiezas}",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Cajas reservadas: ${stock.reservadoCajas}",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Piezas reservadas: ${stock.reservadoPiezas}",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Cajas entrantes: ${stock.entranteCajas}",
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Piezas entrantes: ${stock.entrantePiezas}",
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
          ),
        );
      },
    );
  }

  Widget padding(Widget widget) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: widget,
    );
  }
}
