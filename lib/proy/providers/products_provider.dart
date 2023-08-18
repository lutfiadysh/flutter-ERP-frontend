import 'dart:typed_data';
import 'package:admin_dashboard/proy/api/BackendApi.dart';
import 'package:admin_dashboard/proy/models/product.dart';
import 'package:flutter/material.dart';
import '../models/http/products_response.dart';

class ProductsProvider extends ChangeNotifier {
  List<Producto> productos = [];
  Producto? producto;

  getProducts() async {
    final resp = await BackendApi.httpGet('/productos');
    final productsResp = ProductsResponse.fromMap(resp);

    productos = [...productsResp.productos];

    notifyListeners();
  }

  Future<List<Producto>> getData(String? filter) async {
    try {
      final response = await BackendApi.httpGet('productos?filter=$filter');
      final data = response;

      if (data != null) {
        return productos;
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  Future updateProduct(String id, String name, double? precioPorCaja,
      double? precioPorUnidad) async {
    final data = {
      'nombre': name,
      'precioCaja': precioPorCaja,
      'precioPorUnidad': precioPorUnidad,
    };

    try {
      await BackendApi.put('/productos/$id', data);

      productos = productos.map((product) {
        if (product.id != id) return product;

        product.nombre = name;
        product.precioCaja = precioPorCaja;
        product.precioPorUnidad = precioPorUnidad;
        return product;
      }).toList();

      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future newProduct(String name, String category, double? precioPorCaja,
      double? precioPorUnidad) async {
    final data = {
      'nombre': name,
      'categoria': category,
      'precioCaja': precioPorCaja,
      'precioPorUnidad': precioPorUnidad,
    };

    try {
      final json = await BackendApi.post('/productos', data);
      final newProduct = Producto.fromMap(json);

      productos.add(newProduct);
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future deleteProduct(String id) async {
    try {
      await BackendApi.delete('/productos/$id', {});

      productos.removeWhere((producto) => producto.id == id);

      notifyListeners();
    } catch (e) {
      throw ('Error en eliminar producto');
    }
  }

  Future<Producto> uploadImage(String path, Uint8List bytes) async {
    try {
      final resp = await BackendApi.uploadFile(path, bytes);
      print(resp);
      producto = Producto.fromMap(resp);

      // Encuentra el producto en la lista de productos
      int productIndex =
          productos.indexWhere((prod) => prod.id == producto!.id);

      // Actualiza la imagen del producto en la lista de productos
      if (productIndex != -1) {
        productos[productIndex].img = producto!.img;
        notifyListeners();
      }

      print(producto);
      return producto!;
    } catch (e) {
      print(e);
      throw ('Error al actualizar imagen');
    }
  }

  void refreshProduct(Producto newProduct) {
    productos = productos.map((producto) {
      if (producto.id == newProduct.id) {
        producto = newProduct;
      }
      return producto;
    }).toList();

    notifyListeners();
  }

  Future<Producto?> getProductById(String id) async {
    try {
      final resp = await BackendApi.httpGet('/productos/$id');
      final product = Producto.fromMap(resp);
      print(product);
      return product;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
