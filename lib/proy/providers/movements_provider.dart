import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/movements_response.dart';
import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:flutter/material.dart';

class MovementsProvider extends ChangeNotifier {
  List<Movimiento> movimientos = [];
  List<Movimiento> movimientosPorVenta = [];
  List<Movimiento> movimientosPorPedido = [];
  Map<String, List<Movimiento>> productEntries = {};
  Map<String, List<Movimiento>> productExits = {};
  getMovements() async {
    final respMovements = await BackendApi.httpGet('/movimientos');
    final movementsResp = MovementsResponse.fromMap(respMovements);

    movimientos = [...movementsResp.movimientos];
    notifyListeners();
  }

  Future<void> getProductEntriesAndExits() async {
    final respMovements = await BackendApi.httpGet('/movimientos');
    final movementsResp = MovementsResponse.fromMap(respMovements);

    productEntries.clear();
    productExits.clear();

    for (Movimiento movement in movementsResp.movimientos) {
      String productId = movement.stock.producto.id;

      if (movement.movimiento == "ENTRADA") {
        if (!productEntries.containsKey(productId)) {
          productEntries[productId] = [];
        }
        productEntries[productId]!.add(movement);
      } else if (movement.movimiento == "SALIDA") {
        if (!productExits.containsKey(productId)) {
          productExits[productId] = [];
        }
        productExits[productId]!.add(movement);
      }
    }

    notifyListeners();
  }

  Future<bool> updateMovementOutput({
    required String id,
  }) async {
    try {
      final data = {'_id': id};
      await BackendApi.put('/salidas/$id', data);

      int indexToUpdate =
          movimientos.indexWhere((movement) => movement.id == id);
      if (indexToUpdate != -1) {
        movimientos[indexToUpdate].verificacion = 'VERIFICADO';
        notifyListeners();
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateMovementInput({
    required String id,
  }) async {
    try {
      final data = {'_id': id};
      await BackendApi.put('/entradas/$id', data);

      int indexToUpdate =
          movimientos.indexWhere((movement) => movement.id == id);
      if (indexToUpdate != -1) {
        movimientos[indexToUpdate].verificacion = 'VERIFICADO';
        notifyListeners();
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> getProductMovementsByProductName(String productName) async {
    final respMovements = await BackendApi.search(
        '/movimientos/buscar', {'nombreProducto': productName});
    final movementsResp = MovementsResponse.fromMap(respMovements);

    productEntries.clear();
    productExits.clear();

    for (Movimiento movement in movementsResp.movimientos) {
      String productId = movement.stock.producto.id;

      if (movement.movimiento == "ENTRADA") {
        if (!productEntries.containsKey(productId)) {
          productEntries[productId] = [];
        }
        productEntries[productId]!.add(movement);
      } else if (movement.movimiento == "SALIDA") {
        if (!productExits.containsKey(productId)) {
          productExits[productId] = [];
        }
        productExits[productId]!.add(movement);
      }
    }

    notifyListeners();
  }

  Future<void> getMovementsBySale(String saleId) async {
    try {
      final respMovements =
          await BackendApi.httpGet('/movimientos/venta/$saleId');
      final movementsResp = MovementsResponse.fromMap(respMovements);

      // Limpia la lista de movimientos por venta.
      movimientosPorVenta.clear();

      // Asigna los nuevos movimientos desde la respuesta a la lista de movimientos por venta.
      movimientosPorVenta = [...movementsResp.movimientos];

      notifyListeners();
    } catch (e) {
      // Aquí puedes manejar cualquier error o excepción que quieras.
    }
  }

  Future<void> getMovementsByOrder(String orderId) async {
    try {
      final respMovements =
          await BackendApi.httpGet('/movimientos/pedido/$orderId');
      final movementsResp = MovementsResponse.fromMap(respMovements);

      // Limpia la lista de movimientos por venta.
      movimientosPorPedido.clear();

      // Asigna los nuevos movimientos desde la respuesta a la lista de movimientos por venta.
      movimientosPorPedido = [...movementsResp.movimientos];

      notifyListeners();
    } catch (e) {
      // Aquí puedes manejar cualquier error o excepción que quieras.
    }
  }
}
