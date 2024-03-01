import 'package:hive_flutter/hive_flutter.dart';
import 'package:proyecto_integrador/Modelo/MListaVentas.dart';
import 'package:proyecto_integrador/Modelo/MProductos.dart';

class CdorVenta{

  List<Venta> carrito = [];
  
  void agregarAlCarrito(Producto producto, int cantidad) {
    int id = carrito.length + 1;
    double subtotal = producto.precio * cantidad;
    carrito.add(Venta(id: id, producto: producto, cantidad: cantidad, subtotal: subtotal));
  }

  void actualizarCantidad(Venta venta, int nuevaCantidad) {
    venta.cantidad = nuevaCantidad;
    venta.subtotal = venta.producto.precio * nuevaCantidad;
  }

  void eliminarDelCarrito(Venta venta) {
    carrito.remove(venta);
  }

  double calcularTotal() {
    return carrito.fold(0, (total, venta) => total + venta.subtotal);
    
  }

  void realizarVenta() {
    for (var venta in carrito) {
      venta.producto.stock -= venta.cantidad;
      actualizarProductoEnHive(venta.producto);
    }
    carrito.clear();
  }

  void actualizarProductoEnHive(Producto producto) {
    var productos = Hive.box('productos');
    productos.put(producto.id, producto.toMap());
  }
}