import 'package:proyecto_integrador/Modelo/MProductos.dart';
import 'package:proyecto_integrador/Modelo/MListaVentas.dart';
class VentasRealizadas {
  Producto idProducto;
  List<Venta> listaVentas;
  double total;

  VentasRealizadas({
    required this.idProducto,
    required this.listaVentas,
    required this.total,
  });

  Producto get getIdProducto => idProducto;
  List<Venta> get getListaVentas => listaVentas;
  double get getTotal => total;

  set setIdProducto(Producto idProducto) => this.idProducto = idProducto;
  set setListaVentas(List<Venta> listaVentas) => this.listaVentas = listaVentas;
  set setTotal(double total) => this.total = total;
}