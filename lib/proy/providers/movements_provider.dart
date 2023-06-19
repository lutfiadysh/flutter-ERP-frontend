import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/movements_response.dart';
import 'package:admin_dashboard/proy/models/movement.dart';
import 'package:flutter/material.dart';

class MovementsProvider extends ChangeNotifier {
  List<Movimiento> movimientos = [];
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

      movimientos = movimientos.map((movement) {
        if (movement.id != id) return movement;

        // Actualiza cualquier otro atributo que desees aquí
        movement.verificacion = 'VERIFICADO';

        return movement;
      }).toList();

      notifyListeners();
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

      movimientos = movimientos.map((movement) {
        if (movement.id != id) return movement;

        // Actualiza cualquier otro atributo que desees aquí
        movement.verificacion = 'VERIFICADO';

        return movement;
      }).toList();

      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }
}
