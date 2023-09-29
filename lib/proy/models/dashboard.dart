import 'dart:convert';

class Dashboard {
  final MetasDeVentas metasDeVentas;
  final double montoVentasAnual;
  final double montoVentasMensual;
  final double montoVentasDiario;
  final int porcentajeMermasPorcentaje;
  final double ordenesProcesadasPorcentaje;
  final double oportunidadesNegocioPorcentaje;
  final String id;
  final Sucursal sucursal;
  final int v;
  final List<MontoVentasPorMesAnual> montoVentasPorMesAnual;

  Dashboard({
    required this.metasDeVentas,
    required this.montoVentasAnual,
    required this.montoVentasMensual,
    required this.montoVentasDiario,
    required this.porcentajeMermasPorcentaje,
    required this.ordenesProcesadasPorcentaje,
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

  factory Dashboard.fromJson(String str) => Dashboard.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Dashboard.fromMap(Map<String, dynamic> json) => Dashboard(
        metasDeVentas: MetasDeVentas.fromMap(json["metasDeVentas"]),
        montoVentasAnual: json["montoVentasAnual"]?.toDouble(),
        montoVentasMensual: json["montoVentasMensual"]?.toDouble(),
        montoVentasDiario: json["montoVentasDiario"],
        porcentajeMermasPorcentaje: json["porcentajeMermasPorcentaje"],
        ordenesProcesadasPorcentaje:
            json["ordenesProcesadasPorcentaje"]?.toDouble(),
        oportunidadesNegocioPorcentaje:
            json["oportunidadesNegocioPorcentaje"]?.toDouble(),
        id: json["_id"],
        sucursal: Sucursal.fromMap(json["sucursal"]),
        v: json["__v"],
        montoVentasPorMesAnual: List<MontoVentasPorMesAnual>.from(
            json["montoVentasPorMesAnual"]
                .map((x) => MontoVentasPorMesAnual.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "metasDeVentas": metasDeVentas.toMap(),
        "montoVentasAnual": montoVentasAnual,
        "montoVentasMensual": montoVentasMensual,
        "montoVentasDiario": montoVentasDiario,
        "porcentajeMermasPorcentaje": porcentajeMermasPorcentaje,
        "ordenesProcesadasPorcentaje": ordenesProcesadasPorcentaje,
        "oportunidadesNegocioPorcentaje": oportunidadesNegocioPorcentaje,
        "_id": id,
        "sucursal": sucursal.toMap(),
        "__v": v,
        "montoVentasPorMesAnual":
            List<dynamic>.from(montoVentasPorMesAnual.map((x) => x.toMap())),
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
        diario: json["diario"],
        mensual: json["mensual"]?.toDouble(),
        anual: json["anual"],
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
