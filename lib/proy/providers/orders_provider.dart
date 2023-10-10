import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/order_response.dart';
import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:admin_dashboard/proy/models/order.dart';
import 'package:flutter/material.dart';

class OrdersProvider extends ChangeNotifier {
  List<Pedido> pedidos = [];
  Pedido? pedido;
  Pedido? selectedPedido;

  Future<void> getOrders() async {
    final resp = await BackendApi.httpGet('/pedidos');
    final ordersResp = OrderResponse.fromMap(resp);

    pedidos = [...ordersResp.pedidos];

    notifyListeners();
  }

  void selectCotizacion(Pedido pedido) {
    selectedPedido = pedido;
    notifyListeners();
  }

  void deselectCotizacion() {
    selectedPedido = null;
    notifyListeners();
  }

  Future<void> newOrder(List<ProductoDetalle> productos) async {
    final Map<String, dynamic> data = {
      'productos': productos.map((producto) {
        return {
          'producto': producto.producto!.id,
          'cantidadCajas': producto.cantidadCajas,
        };
      }).toList(),
    };

    try {
      final resp = await BackendApi.postAux('/pedidos', data);
      final newProviders =
          (resp as List).map((item) => Pedido.fromMap(item)).toList();
      pedidos.addAll(newProviders);
      notifyListeners();
    } catch (e) {
      throw Exception('Error al crear el pedido $e');
    }
  }

  Future<void> updateOrder(String id, List<ProductoDetalle> productos) async {
    final Map<String, dynamic> data = {
      'productoDetalles': productos.map((producto) {
        return {
          'producto': producto.producto!.id,
          'cantidadCajas': producto.cantidadCajas,
        };
      }).toList(),
    };

    try {
      await BackendApi.putAux('/pedidos/$id', data);

      pedidos = pedidos.map((pedido) {
        if (pedido.id == id) {
          pedido.productoDetalles = productos;
        }
        return pedido;
      }).toList();

      notifyListeners();
    } catch (e) {
      throw Exception('Error al crear el pedido $e');
    }
  }

//Crear movimientos para las ordenes y actualizar el estado de pedido

  Future<void> createOrderMovements(String id) async {
    final String url = '/pedidos/crear-movimientos/$id';
    final data = {"pedido": id};

    try {
      final response = await BackendApi.put(url, data);

      // Actualizar la lista de pedidos en el cliente
      pedidos = pedidos.map((pedido) {
        if (pedido.id == id) {
          pedido.movimientos = (response['movimientos'] as List)
              .map((item) => Movimiento.fromMap(item))
              .toList();
        }
        return pedido;
      }).toList();

      notifyListeners();
    } catch (e) {
      throw Exception('Error al crear el pedido: $e');
    }
  }

//   Future<void> createPdf(Pedido pedido) async {
  Future deleteProvider(
    String id,
  ) async {
    try {
      await BackendApi.delete('/pedidos/$id', {});

      pedidos.removeWhere((provider) => provider.id == id);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
