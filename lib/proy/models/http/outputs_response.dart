import 'dart:convert';
import 'package:admin_dashboard/proy/models/output.dart';

class OutputResponse {
  OutputResponse({
    required this.total,
    required this.salidas,
  });

  int total;
  List<Salida> salidas;

  factory OutputResponse.fromJson(String str) =>
      OutputResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OutputResponse.fromMap(Map<String, dynamic> json) => OutputResponse(
        total: json["total"],
        salidas:
            List<Salida>.from(json["salidas"].map((x) => Salida.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "salidas": List<dynamic>.from(salidas.map((x) => x.toMap())),
      };
}
