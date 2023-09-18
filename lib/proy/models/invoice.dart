import 'dart:convert';

class Factura {
  final String actividadEconomica;
  final String nitEmisor;
  final String razonSocialEmisor;
  final int codigoMetodoPago;
  final int codigoMoneda;
  final int tipoCambio;
  final String leyenda;
  final int codigoDocumentoSector;
  final String id;
  final String usuario;
  final int numeroFactura;
  final String cuf;
  final int codigoSucursal;
  final String direccion;
  final DateTime fechaEmision;
  final String codigoCliente;
  final int montoTotal;
  final int montoTotalSujetoIva;
  final int montoTotalMoneda;
  final int codigoTipoDocumentoIdentidad;
  final String numeroDocumento;
  final String nombreRazonSocial;
  final String municipio;
  final List<Detalle> detalles;

  Factura({
    required this.actividadEconomica,
    required this.nitEmisor,
    required this.razonSocialEmisor,
    required this.codigoMetodoPago,
    required this.codigoMoneda,
    required this.tipoCambio,
    required this.leyenda,
    required this.codigoDocumentoSector,
    required this.id,
    required this.usuario,
    required this.numeroFactura,
    required this.cuf,
    required this.codigoSucursal,
    required this.direccion,
    required this.fechaEmision,
    required this.codigoCliente,
    required this.montoTotal,
    required this.montoTotalSujetoIva,
    required this.montoTotalMoneda,
    required this.codigoTipoDocumentoIdentidad,
    required this.numeroDocumento,
    required this.nombreRazonSocial,
    required this.municipio,
    required this.detalles,
  });

  factory Factura.fromJson(String str) => Factura.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Factura.fromMap(Map<String, dynamic> json) => Factura(
        actividadEconomica: json["actividadEconomica"],
        nitEmisor: json["nitEmisor"],
        razonSocialEmisor: json["razonSocialEmisor"],
        codigoMetodoPago: json["codigoMetodoPago"],
        codigoMoneda: json["codigoMoneda"],
        tipoCambio: json["tipoCambio"],
        leyenda: json["leyenda"],
        codigoDocumentoSector: json["codigoDocumentoSector"],
        id: json["_id"],
        usuario: json["usuario"],
        numeroFactura: json["numeroFactura"],
        cuf: json["cuf"],
        codigoSucursal: json["codigoSucursal"],
        direccion: json["direccion"],
        fechaEmision: DateTime.parse(json["fechaEmision"]),
        codigoCliente: json["codigoCliente"],
        montoTotal: json["montoTotal"],
        montoTotalSujetoIva: json["montoTotalSujetoIva"],
        montoTotalMoneda: json["montoTotalMoneda"],
        codigoTipoDocumentoIdentidad: json["codigoTipoDocumentoIdentidad"],
        numeroDocumento: json["numeroDocumento"],
        nombreRazonSocial: json["nombreRazonSocial"],
        municipio: json["municipio"],
        detalles:
            List<Detalle>.from(json["detalles"].map((x) => Detalle.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "actividadEconomica": actividadEconomica,
        "nitEmisor": nitEmisor,
        "razonSocialEmisor": razonSocialEmisor,
        "codigoMetodoPago": codigoMetodoPago,
        "codigoMoneda": codigoMoneda,
        "tipoCambio": tipoCambio,
        "leyenda": leyenda,
        "codigoDocumentoSector": codigoDocumentoSector,
        "_id": id,
        "usuario": usuario,
        "numeroFactura": numeroFactura,
        "cuf": cuf,
        "codigoSucursal": codigoSucursal,
        "direccion": direccion,
        "fechaEmision": fechaEmision.toIso8601String(),
        "codigoCliente": codigoCliente,
        "montoTotal": montoTotal,
        "montoTotalSujetoIva": montoTotalSujetoIva,
        "montoTotalMoneda": montoTotalMoneda,
        "codigoTipoDocumentoIdentidad": codigoTipoDocumentoIdentidad,
        "numeroDocumento": numeroDocumento,
        "nombreRazonSocial": nombreRazonSocial,
        "municipio": municipio,
        "detalles": List<dynamic>.from(detalles.map((x) => x.toMap())),
      };
}

class Detalle {
  final String id;
  final String codigoProducto;
  final String descripcion;
  final String productoNombre;
  final int cantidad;
  final int unidadMedida;
  final int precioUnitario;
  final int montoDescuento;
  final int subTotal;

  Detalle({
    required this.id,
    required this.codigoProducto,
    required this.descripcion,
    required this.cantidad,
    required this.unidadMedida,
    required this.precioUnitario,
    required this.montoDescuento,
    required this.subTotal,
    required this.productoNombre,
  });

  factory Detalle.fromJson(String str) => Detalle.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Detalle.fromMap(Map<String, dynamic> json) => Detalle(
        id: json["_id"],
        codigoProducto: json["codigoProducto"],
        descripcion: json["descripcion"],
        cantidad: json["cantidad"],
        unidadMedida: json["unidadMedida"],
        precioUnitario: json["precioUnitario"],
        montoDescuento: json["montoDescuento"],
        subTotal: json["subTotal"],
        productoNombre: json["productoNombre"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "codigoProducto": codigoProducto,
        "descripcion": descripcion,
        "cantidad": cantidad,
        "unidadMedida": unidadMedida,
        "precioUnitario": precioUnitario,
        "montoDescuento": montoDescuento,
        "subTotal": subTotal,
        "productoNombre": productoNombre,
      };
}
