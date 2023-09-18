import 'dart:convert';

import 'package:admin_dashboard/proy/models/invoice.dart';

class InvoicesResponse {
  final List<Factura> facturas;
  final int total;

  InvoicesResponse({
    required this.facturas,
    required this.total,
  });

  factory InvoicesResponse.fromJson(String str) =>
      InvoicesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InvoicesResponse.fromMap(Map<String, dynamic> json) =>
      InvoicesResponse(
        facturas:
            List<Factura>.from(json["facturas"].map((x) => Factura.fromMap(x))),
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "facturas": List<dynamic>.from(facturas.map((x) => x.toMap())),
        "total": total,
      };
}
