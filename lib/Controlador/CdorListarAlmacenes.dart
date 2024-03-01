import 'package:proyecto_integrador/Modelo/MAlmacenes.dart';
import 'package:hive/hive.dart';

class ListarAlmacenes{

  List<MAlmacenes> mostrarAlmacenes(){

    var productos = Hive.box('almacenes');
    List<MAlmacenes> listaAlmacenes = [];

    for(var producto in productos.values){
      listaAlmacenes.add(MAlmacenes(
        id: producto['id'],
        nombre: producto['nombre'],
      ));
    }
    return listaAlmacenes;
  }


}