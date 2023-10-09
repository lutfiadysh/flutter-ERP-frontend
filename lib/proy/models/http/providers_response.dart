import 'dart:convert';

import 'package:admin_dashboard/proy/models/provider.dart';

class ProvidersResponse {
  final int total;
  final List<Proveedor> proveedores;

  ProvidersResponse({
    required this.total,
    required this.proveedores,
  });

  factory ProvidersResponse.fromJson(String str) =>
      ProvidersResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProvidersResponse.fromMap(Map<String, dynamic> json) =>
      ProvidersResponse(
        total: json["total"],
        proveedores: List<Proveedor>.from(
            json["proveedores"].map((x) => Proveedor.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "proveedores": List<dynamic>.from(proveedores.map((x) => x.toMap())),
      };
}
