import 'package:hive/hive.dart';

class CdorAlmacenes{

  void AgregarAlmacen(
    int id,
    String nombre,
  ) {
    bool isValid = true;
    if (isValid) {
      var almacenes = Hive.box('almacenes');
      almacenes.put(id, {'id': id, 'nombre': nombre});
    }
  }

  void eliminarAlmacen(int id) {
    var almacenes = Hive.box('almacenes');
    almacenes.deleteAt(id);
  }

  Future<void> actualizarAlmacen(int index, int id, String nombre) async {
    var almacenes = Hive.box('almacenes');
    var almacen = almacenes.getAt(index);
    if (almacen != null) {
      almacen['id'] = id;
      almacen['nombre'] = nombre;
      await almacenes.putAt(index, almacen);
    } 
  }
  List<dynamic> obtenerNombresAlmacenes() {
  var almacenes = Hive.box('almacenes');
  return almacenes.values.map((almacen) => almacen['nombre']).toList();
}
}