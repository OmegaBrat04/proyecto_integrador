import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Vista/Almacenes.dart';
import 'package:proyecto_integrador/Vista/Inicio.dart';
import 'package:proyecto_integrador/Vista/MostrarVentas.dart';
import 'package:proyecto_integrador/Vista/Productos.dart';
import 'package:proyecto_integrador/Vista/main.dart';
import 'package:proyecto_integrador/Vista/registro.dart';

void main() {
  runApp(MiMenu());
}

class MiMenu extends StatelessWidget {
  const MiMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuPrincipal(),
    );
  }
}

class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({super.key});

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Principal",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 148, 41, 41),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MiVentana()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.storage_rounded, color: Color.fromARGB(255, 148, 41, 41),),
                    Text(
                      " Almacenes",
                      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 148, 41, 41)),
                      
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(elevation: 3, backgroundColor: Colors.white),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => A_Prod()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_rounded, color: Color.fromARGB(255, 148, 41, 41),),
                    Text(
                      " Productos",
                      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 148, 41, 41)),
                      
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(elevation: 3, backgroundColor: Colors.white),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {
                   Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart, color: Color.fromARGB(255, 148, 41, 41),),
                    Text(
                      " Realizar Ventas",
                      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 148, 41, 41)),
                      
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(elevation: 3, backgroundColor: Colors.white),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MostrarV()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.addchart_sharp, color: Color.fromARGB(255, 148, 41, 41),),
                    Text(
                      " Mostrar Ventas",
                      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 148, 41, 41)),
                      
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(elevation: 3, backgroundColor: Colors.white),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {
                   Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegistroU()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.supervised_user_circle, color: Color.fromARGB(255, 148, 41, 41),),
                    Text(
                      " Gestion de Usuarios",
                      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 148, 41, 41)),
                      
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(elevation: 3, backgroundColor: Colors.white),
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InicioSesion()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout_rounded, color: Color.fromARGB(255, 148, 41, 41),),
                    Text(
                      " Cerrar Sesion",
                      style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 148, 41, 41)),
                      
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(elevation: 3, backgroundColor: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
