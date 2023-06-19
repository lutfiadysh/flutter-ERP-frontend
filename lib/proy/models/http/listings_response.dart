// To parse this JSON data, do
//
//     final listingsResponse = listingsResponseFromMap(jsonString);

import 'dart:convert';

import 'package:admin_dashboard/proy/models/listing.dart';

class ListingsResponse {
  String message;
  int total;
  List<Cotizacion> cotizaciones;

  ListingsResponse({
    required this.message,
    required this.total,
    required this.cotizaciones,
  });

  factory ListingsResponse.fromJson(String str) =>
      ListingsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListingsResponse.fromMap(Map<String, dynamic> json) =>
      ListingsResponse(
        message: json["message"],
        total: json["total"],
        cotizaciones: List<Cotizacion>.from(
            json["cotizaciones"].map((x) => Cotizacion.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "total": total,
        "cotizaciones": List<dynamic>.from(cotizaciones.map((x) => x.toMap())),
      };
}
