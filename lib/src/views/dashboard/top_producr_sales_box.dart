import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/constant/text.dart';
import 'package:flutter/material.dart';

class TopProductSale extends StatefulWidget {
  final String titulo;
  final String cantidad;
  final String producto;
  final String descripcion;
  TopProductSale(
      {Key? key,
      required this.titulo,
      required this.cantidad,
      required this.producto,
      required this.descripcion})
      : super(key: key);

  @override
  State<TopProductSale> createState() => _TopProductSaleState();
}

class _TopProductSaleState extends State<TopProductSale> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: ColorConst.primary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      elevation: 7,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 250,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            // color: ColorConst.primary,
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ConstText.lightText(
                text: widget.titulo,
                // color: ColorConst.white.withOpacity(0.5),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              ConstText.largeText(
                text: widget.cantidad,
                fontSize: 33,
                color: ColorConst.primary,
                fontWeight: FontWeight.bold,
              ),
              ConstText.lightText(
                text: widget.producto,
                color: ColorConst.primary,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              ConstText.lightText(
                text: widget.descripcion,
                textAlign: TextAlign.center,
                fontSize: 15,
                // color: ColorConst.white.withOpacity(0.5),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
