import 'dart:convert';

import 'package:admin_dashboard/proy/models/sale.dart';

class SalesResponse {
  final String message;
  final List<Venta> ventas;
  final int total;

  SalesResponse({
    required this.message,
    required this.ventas,
    required this.total,
  });

  factory SalesResponse.fromJson(String str) =>
      SalesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SalesResponse.fromMap(Map<String, dynamic> json) => SalesResponse(
        message: json["message"],
        ventas: List<Venta>.from(json["ventas"].map((x) => Venta.fromMap(x))),
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "ventas": List<dynamic>.from(ventas.map((x) => x.toMap())),
        "total": total,
      };
}
