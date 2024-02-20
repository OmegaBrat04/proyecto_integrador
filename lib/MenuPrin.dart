import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Almacenes.dart';
import 'package:proyecto_integrador/Inicio.dart';
import 'package:proyecto_integrador/Productos.dart';
void main(){
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
        title: Text("Menu Principal" ,style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                 Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>InicioSesion())
                  );
              }, 
            child: Text("Regresar al Inicio")
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>MiVentana())
                  );
            }, 
            child: Text("Continuar")),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>A_Prod())
                  );
            }, 
            child: Text("Productos"))
            ],
          ),
        ),
      
    );
  }
}