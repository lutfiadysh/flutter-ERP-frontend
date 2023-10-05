import 'dart:convert';

import 'package:admin_dashboard/proy/models/movement.dart';

class Dashboard {
  final MetasDeVentas metasDeVentas;
  final double montoVentasAnual;
  final double montoVentasMensual;
  final double montoVentasDiario;
  final double porcentajeMermas;
  final double porcentajeVerificados;
  final double porcentajePendientes;
  final double porcentajeEntradas;
  final double porcentajeSalidas;
  final double porcentajeErrores;
  final double oportunidadesNegocioPorcentaje;
  final String id;
  final Sucursal sucursal;
  final int v;
  final List<MontoVentasPorMesAnual> montoVentasPorMesAnual;
  final String productoMasVendido;
  final String productoMenosVendido;
  final String productoMasRentable;
  final String productoMenosRentable;
  final int productoMasVendidoCantidad;
  final int productoMenosVendidoCantidad;
  final double productoMasRentableMonto;
  final double productoMenosRentableMonto;
  final List<Movimiento> movimientosRecientes;

  Dashboard({
    required this.movimientosRecientes,
    required this.productoMasVendido,
    required this.productoMenosVendido,
    required this.productoMasRentable,
    required this.productoMenosRentable,
    required this.productoMasVendidoCantidad,
    required this.productoMenosVendidoCantidad,
    required this.productoMasRentableMonto,
    required this.productoMenosRentableMonto,
    required this.metasDeVentas,
    required this.montoVentasAnual,
    required this.montoVentasMensual,
    required this.montoVentasDiario,
    required this.porcentajeMermas,
    required this.porcentajePendientes,
    required this.porcentajeEntradas,
    required this.porcentajeSalidas,
    required this.porcentajeErrores,
    required this.porcentajeVerificados,
    required this.oportunidadesNegocioPorcentaje,
    required this.id,
    required this.sucursal,
    required this.v,
    required this.montoVentasPorMesAnual,
  });

  String formatNumber(double num) {
    String suffix = "";

    if (num >= 10000) {
      num = num / 1000;
      suffix = "K";
    }

    // Redondeo a .50 o .00
    double fractional = num - num.floor();
    if (fractional >= 0.25 && fractional < 0.75) {
      num = num.floor() + 0.5;
    } else if (fractional >= 0.75) {
      num = num.floor() + 1;
    } else {
      num = num.floor().toDouble();
    }

    // Asegurar que se muestren decimales solo cuando hay una fracción
    String result =
        (num == num.floor()) ? num.toStringAsFixed(0) : num.toStringAsFixed(2);

    return "$result$suffix";
  }

  String get montoVentasAnualFormateado => formatNumber(montoVentasAnual);
  String get montoVentasMensualFormateado => formatNumber(montoVentasMensual);
  String get montoVentasDiarioFormateado => formatNumber(montoVentasDiario);
  String get productoMasRentableMontoFormateado =>
      formatNumber(productoMasRentableMonto);
  String get productoMenosRentableMontoFormateado =>
      formatNumber(productoMenosRentableMonto);

  String get porcentajeMermasFormateado {
    return porcentajeMermas.toStringAsFixed(1);
  }

  String get porcentajePendientesFormateado {
    return porcentajePendientes.toStringAsFixed(1);
  }

  String get porcentajeEntradasFormateado {
    return porcentajeEntradas.toStringAsFixed(1);
  }

  String get porcentajeSalidasFormateado {
    return porcentajeSalidas.toStringAsFixed(1);
  }

  String get porcentajeErroresFormateado {
    return porcentajeErrores.toStringAsFixed(1);
  }

  String get porcentajeVerificadosFormateado {
    return porcentajeVerificados.toStringAsFixed(1);
  }

  factory Dashboard.fromJson(String str) => Dashboard.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dashboard.fromMap(Map<String, dynamic> json) => Dashboard(
        movimientosRecientes: List<Movimiento>.from(
            json["movimientosRecientes"].map((x) => Movimiento.fromMap(x))),
        metasDeVentas: MetasDeVentas.fromMap(json["metasDeVentas"]),
        montoVentasAnual: json["montoVentasAnual"]?.toDouble(),
        montoVentasMensual: json["montoVentasMensual"]?.toDouble(),
        montoVentasDiario: json["montoVentasDiario"].toDouble(),
        porcentajeMermas: json["porcentajeMermas"].toDouble(),
        porcentajePendientes: json["porcentajePendientes"].toDouble(),
        porcentajeEntradas: json["porcentajeEntradas"].toDouble(),
        porcentajeSalidas: json["porcentajeSalidas"].toDouble(),
        porcentajeErrores: json["porcentajeErrores"].toDouble(),
        porcentajeVerificados: json["porcentajeVerificados"]?.toDouble(),
        oportunidadesNegocioPorcentaje:
            json["oportunidadesNegocioPorcentaje"]?.toDouble(),
        id: json["_id"],
        sucursal: Sucursal.fromMap(json["sucursal"]),
        v: json["__v"],
        montoVentasPorMesAnual: List<MontoVentasPorMesAnual>.from(
            json["montoVentasPorMesAnual"]
                .map((x) => MontoVentasPorMesAnual.fromMap(x))),
        productoMasVendido: json["productoMasVendido"] ?? "N/A",
        productoMenosVendido: json["productoMenosVendido"] ?? "N/A",
        productoMasRentable: json["productoMasRentable"] ?? "N/A",
        productoMenosRentable: json["productoMenosRentable"] ?? "N/A",
        productoMasVendidoCantidad: json["productoMasVendidoCantidad"],
        productoMenosVendidoCantidad: json["productoMenosVendidoCantidad"],
        productoMasRentableMonto: json["productoMasRentableMonto"].toDouble(),
        productoMenosRentableMonto:
            json["productoMenosRentableMonto"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "metasDeVentas": metasDeVentas.toMap(),
        "montoVentasAnual": montoVentasAnual,
        "montoVentasMensual": montoVentasMensual,
        "montoVentasDiario": montoVentasDiario,
        "porcentajeMermas": porcentajeMermas,
        "porcentajeVerificados": porcentajeVerificados,
        "oportunidadesNegocioPorcentaje": oportunidadesNegocioPorcentaje,
        "_id": id,
        "sucursal": sucursal.toMap(),
        "__v": v,
        "montoVentasPorMesAnual":
            List<dynamic>.from(montoVentasPorMesAnual.map((x) => x.toMap())),
        "productoMasVendido": productoMasVendido,
        "productoMenosVendido": productoMenosVendido,
        "productoMasRentable": productoMasRentable,
        "productoMenosRentable": productoMenosRentable,
        "productoMasVendidoCantidad": productoMasVendidoCantidad,
        "productoMenosVendidoCantidad": productoMenosVendidoCantidad,
        "productoMasRentableMonto": productoMasRentableMonto,
        "productoMenosRentableMonto": productoMenosRentableMonto,
      };
}

class MetasDeVentas {
  final double diario;
  final double mensual;
  final double anual;

  MetasDeVentas({
    required this.diario,
    required this.mensual,
    required this.anual,
  });

  String formatNumber(double num) {
    String suffix = "";

    if (num >= 10000) {
      num = num / 1000;
      suffix = "K";
    }

    // Redondeo a .50 o .00
    double fractional = num - num.floor();
    if (fractional >= 0.25 && fractional < 0.75) {
      num = num.floor() + 0.5;
    } else if (fractional >= 0.75) {
      num = num.floor() + 1;
    } else {
      num = num.floor().toDouble();
    }

    // Asegurar que se muestren decimales solo cuando hay una fracción
    String result =
        (num == num.floor()) ? num.toStringAsFixed(0) : num.toStringAsFixed(2);

    return "$result$suffix";
  }

  String get montoMetaVentasAnualFormateado => formatNumber(anual);
  String get montoMetaVentasMensualFormateado => formatNumber(mensual);
  String get montoMetaVentasDiarioFormateado => formatNumber(diario);
  factory MetasDeVentas.fromJson(String str) =>
      MetasDeVentas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MetasDeVentas.fromMap(Map<String, dynamic> json) => MetasDeVentas(
        diario: json["diario"].toDouble(),
        mensual: json["mensual"]?.toDouble(),
        anual: json["anual"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "diario": diario,
        "mensual": mensual,
        "anual": anual,
      };
}

class MontoVentasPorMesAnual {
  final String id;
  final int year;
  final int month;
  final double total;

  MontoVentasPorMesAnual({
    required this.id,
    required this.year,
    required this.month,
    required this.total,
  });

  factory MontoVentasPorMesAnual.fromJson(String str) =>
      MontoVentasPorMesAnual.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MontoVentasPorMesAnual.fromMap(Map<String, dynamic> json) =>
      MontoVentasPorMesAnual(
        id: json["_id"],
        year: json["year"],
        month: json["month"],
        total: json["total"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "year": year,
        "month": month,
        "total": total,
      };
}

class Sucursal {
  final String id;
  final String municipio;
  final int codigoSucursal;

  Sucursal({
    required this.id,
    required this.municipio,
    required this.codigoSucursal,
  });

  factory Sucursal.fromJson(String str) => Sucursal.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Sucursal.fromMap(Map<String, dynamic> json) => Sucursal(
        id: json["_id"],
        municipio: json["municipio"],
        codigoSucursal: json["codigoSucursal"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "municipio": municipio,
        "codigoSucursal": codigoSucursal,
      };
}
