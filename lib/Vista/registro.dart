import 'package:flutter/material.dart';

import 'package:proyecto_integrador/Controlador/CdorListarUsuarios.dart';
import 'package:proyecto_integrador/Controlador/CdorUsuarios.dart';
import 'package:proyecto_integrador/Modelo/MUsuarios.dart';
import 'package:proyecto_integrador/Vista/MenuPrin.dart';

class RegistroU extends StatefulWidget {
  final List<Usuario> listaUsuarios;
  RegistroU({Key? key, required this.listaUsuarios}) : super(key: key);

  @override
  State<RegistroU> createState() => _RegistroUState();
}

class _RegistroUState extends State<RegistroU> {

  final CdorUsuarios cdorUsuarios = CdorUsuarios();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final ListarUsuarios listarUsuarios = ListarUsuarios();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {

                    Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MiMenu()));
                   // Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                 SizedBox(
                      width: 90,
                    ),
                    Text("Registro",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black)),
              ],
            ),
            SizedBox(
                height: 30,
              ),
              Container(
                child: TextField(
                  controller: nombreController,
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.lightBlueAccent,
                  decoration: InputDecoration(
                      labelText: "Introduce Nombre de Usuario",
                      labelStyle: TextStyle(fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextField(
                  controller: correoController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: const Color.fromARGB(255, 133, 30, 30),
                  decoration: InputDecoration(
                      labelText: "Introduzca su Correo",
                      labelStyle: TextStyle(fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextField(
                  controller: contrasenaController,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Color.fromARGB(255, 133, 30, 30),
                  decoration: InputDecoration(
                      labelText: "Introduzca su Contraseña",
                      labelStyle: TextStyle(fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {

                      String nombreUsuario = nombreController.text;
                      String correo = correoController.text;
                      String contrasena = contrasenaController.text;
                      cdorUsuarios.agregarUsuario(nombreUsuario, correo, contrasena);

                    },
                    icon: Icon(
                      Icons.save,
                      size: 50,
                      color: Color.fromARGB(255, 148, 41, 41),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      size: 50,
                      color: Color.fromARGB(255, 148, 41, 41),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete,
                      size: 50,
                      color: Color.fromARGB(255, 148, 41, 41),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  itemCount: listarUsuarios.mostrarUsuarios().length,
                  itemBuilder: (context, index) {
                    var usuario = listarUsuarios.mostrarUsuarios()[index];
                    return ListTile(
                      leading: Text(usuario.nombreUsuario.toString()),
                      title: Text(usuario.correo),
                      subtitle: Text(usuario.contrasena),
                      //trailing: Text(producto.stock.toString()),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
