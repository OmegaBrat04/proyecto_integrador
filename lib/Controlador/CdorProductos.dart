import 'package:hive/hive.dart';
import 'package:proyecto_integrador/Modelo/MProductos.dart';

class AgregarProductos {
  void agregarProducto(
      int id, String nombre, double precio, int stock, String almacen) {
    bool isValid = true;
    if (isValid) {
      var productos = Hive.box('productos');
      productos.put(id, {
        'id': id,
        'nombre': nombre,
        'precio': precio,
        'stock': stock,
        'almacen': almacen
      });
    }
  }

  void eliminarProducto(int id) {
    var productos = Hive.box('productos');
    productos.deleteAt(id);
  }

  Future<void> actualizarProducto(
      int index, int id, String nombre, double precio, int stock, String almacen) async {
    var productos = Hive.box('productos');
    var producto = productos.getAt(index);
    if (producto != null) {
      producto['id'] = id;
      producto['nombre'] = nombre;
      producto['precio'] = precio;
      producto['stock'] = stock;
      producto['almacen'] = almacen;
      await productos.putAt(index, producto);
    }
  }

  Producto obtenerProductoPorId(int id) {
  var productos = Hive.box('productos');
  var productoMap = productos.get(id);
  if (productoMap != null) {
    return Producto(
      id: productoMap['id'],
      nombre: productoMap['nombre'],
      precio: productoMap['precio'],
      stock: productoMap['stock'],
      almacen: productoMap['almacen'],
    );
  } else {
    throw Exception('No se encontró el producto con el ID $id');
  }
}

}
