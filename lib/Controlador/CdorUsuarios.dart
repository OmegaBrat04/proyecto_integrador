import 'package:hive/hive.dart';
class CdorUsuarios{
  void agregarUsuario(  
    String nombreUsuario,
    String correo,
    String contrasena,
  ) {
    bool isValid = true;
    if (isValid) {
      var usuarios = Hive.box('usuarios');
      usuarios.put(correo, {'nombreUsuario': nombreUsuario, 'correo': correo, 'contrasena': contrasena});
    }
  }

  void eliminarUsuario(int id) {
    var usuarios = Hive.box('usuarios');
    usuarios.deleteAt(id);
  }

  Future<void> actualizarUsuario(int index, String nombreUsuario, String correo, String contrasena ) async {
    var usuarios = Hive.box('usuarios');
    var usuario = usuarios.getAt(index);
    if (usuario != null) {
      usuario['nombreUsuario'] = nombreUsuario;
      usuario['correo'] = correo;
      usuario['contrasena'] = contrasena;
      await usuarios.putAt(index, usuario);
    } 
  }
}