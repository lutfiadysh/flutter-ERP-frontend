import 'dart:convert';

import '../movement.dart';

class MovementsResponse {
  MovementsResponse({
    required this.total,
    required this.movimientos,
  });

  int total;
  List<Movimiento> movimientos;

  factory MovementsResponse.fromJson(String str) =>
      MovementsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovementsResponse.fromMap(Map<String, dynamic> json) =>
      MovementsResponse(
        total: json["total"],
        movimientos: List<Movimiento>.from(
            json["movimientos"].map((x) => Movimiento.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "movimientos": List<dynamic>.from(movimientos.map((x) => x.toMap())),
      };
}
