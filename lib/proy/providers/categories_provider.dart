import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/http/categories_response.dart';
import 'package:flutter/material.dart';

import '../models/category.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categoria> categorias = [];

  getCategories() async {
    final resp = await BackendApi.httpGet('/categorias');
    final categoriesResp = CategoriesResponse.fromMap(resp);

    categorias = [...categoriesResp.categorias];

    notifyListeners();
  }

  Future newCategory(String dimensiones, String acabado, String material,
      double precioCaja, int unidadesPorCaja) async {
    final data = {
      'dimensiones': dimensiones,
      'acabado': acabado,
      'material': material,
      'precioCaja': precioCaja,
      'unidadesPorCaja': unidadesPorCaja,
    };

    try {
      final json = await BackendApi.post('/categorias', data);

      final newCategory = Categoria.fromMap(json);

      categorias.add(newCategory);
      notifyListeners();
    } catch (e) {
      print(e);
      throw ('Error en crear categoria');
    }
  }

  Future<Categoria?> getCategoryById(String id) async {
    try {
      final resp = await BackendApi.httpGet('/categorias/$id');
      final categoria = Categoria.fromMap(resp);

      return categoria;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future updateCategory(String id, String dimensiones, String acabado,
      String material, double precioCaja, int unidadesPorCaja) async {
    final data = {
      'dimensiones': dimensiones,
      'acabado': acabado,
      'material': material,
      'precioCaja': precioCaja,
      'unidadesPorCaja': unidadesPorCaja,
    };

    try {
      await BackendApi.put('/categorias/$id', data);

      categorias = categorias.map((category) {
        if (category.id != id) return category;

        category.dimensiones = dimensiones;
        category.acabado = acabado;
        category.material = material;
        category.precioCaja = precioCaja;
        category.unidadesPorCaja = unidadesPorCaja;
        return category;
      }).toList();

      notifyListeners();
    } catch (e) {
      throw ('Error en actualizar categoria');
    }
  }

  Future deleteCategory(String id) async {
    try {
      await BackendApi.delete('/categorias/$id', {});

      categorias.removeWhere((categoria) => categoria.id == id);

      notifyListeners();
    } catch (e) {
      throw ('Error en eliminar categoria');
    }
  }
}
