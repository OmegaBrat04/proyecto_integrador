import 'package:flutter/material.dart';
import 'package:proyecto_integrador/MenuPrin.dart';

void main() => runApp(InicioSesion());

class InicioSesion extends StatelessWidget {
  const InicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "InicioSesion",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Iniciar Sesion",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          shadowColor: Colors.black,
          backgroundColor: Color.fromARGB(255, 150, 30, 30)),
      body: Stack(
        children: [
          Container(
            //color: Colors.black,
           child: Image.network(
              "https://www.xtrafondos.com/wallpapers/vertical/spider-man-neon-8163.jpg",
              fit: BoxFit.cover,
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              const SizedBox(height: 15),
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
                    child: const TextField(
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.account_circle,
                          size: 50,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
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
                    child: const TextField(
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          size: 50,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
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
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>MenuPrincipal())
                  );
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
              )
            ],
          )
        ],
      ),
    );
  }
}