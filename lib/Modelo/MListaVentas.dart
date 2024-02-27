import 'package:proyecto_integrador/Modelo/MProductos.dart';

class Venta {
  int id;
  Producto producto;
  int cantidad;
  double subtotal;

  Venta({
    required this.id,
    required this.producto,
    required this.cantidad,
    required this.subtotal,
  });

  int get getId => id;
  Producto get getProducto => producto;
  int get getCantidad => cantidad;
  double get getSubtotal => subtotal;

  set setId(int id) => this.id = id;
  set setProducto(Producto producto) => this.producto = producto;
  set setCantidad(int cantidad) => this.cantidad = cantidad;
  set setSubtotal(double subtotal) => this.subtotal = subtotal;
}