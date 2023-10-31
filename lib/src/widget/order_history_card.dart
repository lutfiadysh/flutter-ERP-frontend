import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:admin_dashboard/src/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class OrderHistoryCard extends StatelessWidget {
  final Movimiento e;
  const OrderHistoryCard({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: ColorConst.blue.withOpacity(.16),
            blurRadius: 12,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: MediaQuery.of(context).size.width / 8,
                height: MediaQuery.of(context).size.width / 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      e.usuario.img.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.usuario.nombre,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${e.stock.producto.nombre.toString()} (${e.cantidadCajas.toString()})",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                e.movimiento,
                style: const TextStyle(
                  fontSize: 12,
                  color: ColorConst.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _formatDate(e.fecha),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              FxBox.h10,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: e.verificacion == 'VERIFICADO'
                        ? ColorConst.teal.withOpacity(.16)
                        : e.verificacion == 'PENDIENTE'
                            ? ColorConst.warning.withOpacity(.16)
                            : e.verificacion == 'ERROR'
                                ? ColorConst.error.withOpacity(.16)
                                : Colors.grey.withOpacity(.16)),
                child: Text(
                  e.verificacion,
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: e.verificacion == 'VERIFICADO'
                          ? ColorConst.teal
                          : e.verificacion == 'PENDIENTE'
                              ? ColorConst.warning
                              : e.verificacion == 'ERROR'
                                  ? ColorConst.error
                                  : Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    // Define el idioma local a español
    var outputFormat = DateFormat("EEEE d 'de' MMMM", 'es_ES');
    return outputFormat.format(date);
  }
}
