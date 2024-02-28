import 'package:proyecto_integrador/Modelo/MProductos.dart';
import 'package:hive/hive.dart';

class ListarProductos{

  List<Producto> mostrarProductos(){

    var productos = Hive.box('productos');
    List<Producto> listaProductos = [];

    for(var producto in productos.values){
      listaProductos.add(Producto(
        id: producto['id'],
        nombre: producto['nombre'],
        precio: (producto['precio']),
        stock:  (producto['stock']),
      ));
    }

    return listaProductos;
  }


}