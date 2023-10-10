import 'dart:convert';

import 'package:admin_dashboard/proy/models/reserve.dart';

class ReservesResponse {
  final int total;
  final List<Reserva> reservas;

  ReservesResponse({
    required this.total,
    required this.reservas,
  });

  factory ReservesResponse.fromJson(String str) =>
      ReservesResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReservesResponse.fromMap(Map<String, dynamic> json) =>
      ReservesResponse(
        total: json["total"],
        reservas:
            List<Reserva>.from(json["reservas"].map((x) => Reserva.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "reservas": List<dynamic>.from(reservas.map((x) => x.toMap())),
      };
}
