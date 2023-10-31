import 'package:admin_dashboard/src/constant/color.dart';
import 'package:admin_dashboard/src/utils/responsive.dart';
import 'package:dio/dio.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutterx/flutterx.dart';

class TopProductSaleCard extends StatelessWidget {
  final String productoMasVendidoCantidad;
  final String productoMasVendido;
  final Color colorIcon;
  final String descripcionBold;
  final String descripcionRegular;
  const TopProductSaleCard({
    super.key,
    required this.productoMasVendido,
    required this.productoMasVendidoCantidad,
    required this.descripcionBold,
    required this.descripcionRegular,
    required this.colorIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: Responsive.isMobile(context)
          ? MediaQuery.of(context).size.width / 2.5
          : MediaQuery.of(context).size.width / 3.5,
      decoration: BoxDecoration(
        color: ColorConst.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productoMasVendido,
                    style: TextStyle(
                      fontSize: Responsive.isMobile(context) ? 19 : 25,
                      color: ColorConst.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    productoMasVendidoCantidad.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Responsive.isMobile(context) ? 12 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FxBox.h16,
                ],
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 6,
                  child: RichText(
                    text: TextSpan(
                      text: descripcionRegular,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Responsive.isMobile(context) ? 9 : 14,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: descripcionBold,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: Responsive.isMobile(context) ? 9 : 14,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          Container(
            width: Responsive.isMobile(context) ? 30 : 50,
            height: Responsive.isMobile(context) ? 30 : 50,
            decoration: BoxDecoration(
              color: colorIcon.withOpacity(.16),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                EneftyIcons.note_2_bold,
                color: colorIcon,
                size: Responsive.isMobile(context) ? 16 : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
