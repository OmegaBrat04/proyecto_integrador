class Usuario {
  String nombreUsuario;
  String correo;
  String contrasena;


  Usuario({
    required this.nombreUsuario,
    required this.correo,
    required this.contrasena,
  });

  Map<String, dynamic> toMap() {
    return {
      'nombreUsuario': nombreUsuario,
      'correo': correo,
      'contrasena': contrasena,
    };
  }

  String get getNombreUsuario => nombreUsuario;
  String get getCorreo => correo;
  String get getContrasena => contrasena;

  set setNombreUsuario(String nombreUsuario) => this.nombreUsuario = nombreUsuario;
  set setCorreo(String correo) => this.correo = correo;
  set setContrasena(String contrasena) => this.contrasena = contrasena;
}