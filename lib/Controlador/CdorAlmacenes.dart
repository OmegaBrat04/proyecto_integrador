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
}