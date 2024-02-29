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
}