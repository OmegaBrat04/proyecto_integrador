import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Vista/MenuPrin.dart';

void main() {
  runApp(RegistroU());
}

class RegistroU extends StatelessWidget {
  const RegistroU({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VentanaR(),
      debugShowCheckedModeBanner: false,
      title: "Registro Usuarios",
    );
  }
}

class VentanaR extends StatefulWidget {
  const VentanaR({super.key});

  @override
  State<VentanaR> createState() => _VentanaRState();
}

class _VentanaRState extends State<VentanaR> {
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
                    onPressed: () {},
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
              Center(
              heightFactor: 8,
              child: Text(
                "ListView de Usuarios Existentes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
