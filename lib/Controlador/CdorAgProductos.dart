import 'package:hive/hive.dart';

class AgregarProductos{

  void agregarProducto(
    int id,
    String nombre,
    double precio,
    int stock, 
  ) {
    bool isValid = true;
    if (isValid) {
      var productos = Hive.box('productos');
      productos.put(id, {'id': id, 'nombre': nombre, 'precio': precio, 'stock': stock});
    }
  }
}