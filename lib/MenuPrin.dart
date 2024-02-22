import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Almacenes.dart';
import 'package:proyecto_integrador/Inicio.dart';
import 'package:proyecto_integrador/Productos.dart';
import 'package:proyecto_integrador/main.dart';

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
        backgroundColor: Colors.redAccent,
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
