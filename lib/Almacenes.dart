import 'package:flutter/material.dart';
import 'package:proyecto_integrador/MenuPrin.dart';
import 'package:proyecto_integrador/main.dart';

void main() {

  runApp(MiVentana());
}

class MiVentana extends StatelessWidget {
  const MiVentana({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "Ventana_Almacen",
      debugShowCheckedModeBanner: false,
      home: Vista()
    );
  }
}
class Vista extends StatefulWidget {
  const Vista({super.key});

  @override
  State<Vista> createState() => _VistaState();
}

class _VistaState extends State<Vista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text("Almacenes"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),

    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          
          children: <Widget> [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(onPressed: (){

                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>MiMenu())
                  );
                },
                 icon: Icon(Icons.arrow_back_ios),
                 ),
                 SizedBox(width: 70,),
                Text("Almacenes", 
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25, 
                  color: Colors.lightGreenAccent)
                  ),
              ]
            ),

            SizedBox(height: 30,),
            Container(
              child:  TextField(
                keyboardType: TextInputType.numberWithOptions(signed: true),
                  cursorColor: Colors.lightBlueAccent,
                  decoration: InputDecoration(
                    
                    labelText: "Introduce ID Del Almacen",
                    labelStyle: TextStyle(fontWeight: FontWeight.w500)
                  ),
      
              ),
            ),
            SizedBox(height: 30,),
             Container(
              child:  TextField(
                keyboardType: TextInputType.name,
                  cursorColor: Colors.lightBlueAccent,
                  decoration: InputDecoration(
                    
                    labelText: "Introduce nombre del Almacen",
                    labelStyle: TextStyle(fontWeight: FontWeight.w500)
                  ),
      
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              IconButton(onPressed: (){

              }, icon: Icon(
                Icons.save,
                size: 50,
                color: Colors.deepPurple,
                ),
                
                ),
                IconButton(onPressed: (){

              }, icon: Icon(
                Icons.delete,
                size: 50,
                color: Colors.deepPurple,
                ),
                
                )

            ],
            ),
            SizedBox(height: 30,),
            Container(
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>MyApp())
                  );
      
      
                },
                
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 40),),
                  
                  Icon(Icons.arrow_circle_right),
                  Text("Ir a las Ventas", style: 
                  TextStyle(
                    fontSize: 25, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.black54),
                  textAlign: TextAlign.center,)
                ],
              )
              ),
            )
          
          ],
        ),
      
      ),
    ),
    );
  }
}