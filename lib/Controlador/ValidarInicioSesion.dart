import 'package:hive_flutter/hive_flutter.dart';
import 'package:proyecto_integrador/Modelo/MUsuarios.dart';

class ValidarSesion{
  Usuario? obtenerUsuarioPorCorreoYContrasena(String correo, String contrasena) {
    var usuarios = Hive.box('usuarios');
    for (var i = 0; i < usuarios.length; i++) {
      var usuarioMap = usuarios.getAt(i);
      if (usuarioMap != null) {
        Usuario usuario = Usuario(
          nombreUsuario: usuarioMap['nombreUsuario'],
          correo: usuarioMap['correo'],
          contrasena: usuarioMap['contrasena'],
        );
        if (usuario.correo == correo && usuario.contrasena == contrasena) {
          return usuario;
        }
      }
    }
    return null;
  }
}