import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proyecto_integrador/Controlador/ValidarInicioSesion.dart';
import 'package:proyecto_integrador/Modelo/MUsuarios.dart';
import 'package:proyecto_integrador/Vista/MenuPrin.dart';
import 'package:proyecto_integrador/Vista/registroInicial.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('productos');
  await Hive.openBox('usuarios');
  await Hive.openBox('almacenes');
  runApp(InicioSesion());
}

class InicioSesion extends StatelessWidget {
  InicioSesion({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "InicioSesion",
      home: FutureBuilder(
        future: Hive.openBox('productos'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return const Inicio();
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final List<Usuario> usuarios = [];
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final ValidarSesion validarSesion = ValidarSesion();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
          title: const Text(
            "Iniciar Sesion",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          shadowColor: Colors.black,
          backgroundColor: Color.fromARGB(255, 150, 30, 30)),*/
      body: Stack(
        children: [
          Container(
            //color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            //color: Colors.black,
            child: Image.network(
              "https://www.xtrafondos.com/wallpapers/vertical/spider-man-neon-8163.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Inicio de Sesion",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 350,
                      child: TextField(
                        controller: correoController,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.account_circle,
                            size: 50,
                            color: Colors.white,
                          ),
                          labelText: "Correo",
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 350,
                      child: TextField(
                        controller: contrasenaController,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            size: 50,
                            color: Colors.white,
                          ),
                          labelText: "Contraseña",
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        obscureText: true,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        // width: 150,
                        height: 2,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Or',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        // width: 150,
                        height: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Color.fromARGB(255, 230, 35, 116),
                            width: 2,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(10),
                      ),
                      child: const Icon(
                        size: 40,
                        Icons.facebook,
                        color: Color.fromARGB(255, 27, 39, 202),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Color.fromARGB(255, 230, 35, 116),
                            width: 2,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(10),
                      ),
                      child: const Icon(
                        size: 40,
                        Icons.email_outlined,
                        color: Color.fromARGB(255, 27, 39, 202),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          String correo = correoController.text;
                          String contrasena = contrasenaController.text;
                          Usuario? usuario =
                              validarSesion.obtenerUsuarioPorCorreoYContrasena(
                                  correo, contrasena);
                          if (usuario != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuPrincipal()));
                          }else{
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Error"),
                                  content: const Text("Usuario o contraseña incorrectos"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Aceptar"),
                                    )
                                  ],
                                );
                              }
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 45),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 230, 35, 116),
                                width: 2.4)),
                        child: const Text(
                          "Ingresar",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 230, 35, 116)),
                        ))
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "No tienes una cuenta? ...  ",
                      style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistroInicial(
                                      listaUsuarios: usuarios,
                                    )));
                      },
                      child: const Text(
                        "Crea una",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.lightBlueAccent,
                            fontStyle: FontStyle.italic),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
