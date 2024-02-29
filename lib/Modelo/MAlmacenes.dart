class MAlmacenes {
  int id;
  String nombre= "";


  MAlmacenes({
    required this.id,
    required this.nombre,
  });

  int get getId => id;
  String get getNombre => nombre;

  set setId(int id) => this.id = id;
  set setNombre(String nombre) => this.nombre = nombre;

  
}