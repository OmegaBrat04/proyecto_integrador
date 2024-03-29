
//import 'package:proyecto_integrador/Modelo/MAlmacenes.dart';

class Producto {
  int id;
  String nombre;
  double precio;
  int stock;
  String almacen;

  Producto({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.stock,
    required this.almacen,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'precio': precio,
      'stock': stock,
      'almacen': almacen,
    };
  }

  int get getId => id;
  String get getNombre => nombre;
  double get getPrecio => precio;
  int get getCantidad => stock;
  String get getAlmacen => almacen;

  set setId(int id) => this.id = id;
  set setNombre(String nombre) => this.nombre = nombre;
  set setPrecio(double precio) => this.precio = precio;
  set setCantidad(int cantidad) => this.stock = cantidad;
  set setAlmacen(String almacen) => this.almacen = almacen;
}

