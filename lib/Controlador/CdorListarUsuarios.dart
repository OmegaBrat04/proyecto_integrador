import 'package:proyecto_integrador/Modelo/MUsuarios.dart';
import 'package:hive/hive.dart';
class ListarUsuarios{

  List<Usuario> mostrarUsuarios(){

    var usuarios = Hive.box('usuarios');
    List<Usuario> listaUsuarios = [];

    for(var usuario in usuarios.values){
      listaUsuarios.add(Usuario(
        nombreUsuario: usuario['nombreUsuario'],
        correo: usuario['correo'],
        contrasena: usuario['contrasena'],
      ));
    }

    return listaUsuarios;
  }}