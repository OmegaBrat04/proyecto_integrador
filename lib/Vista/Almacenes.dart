import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controlador/CdorAlmacenes.dart';
import 'package:proyecto_integrador/Vista/MenuPrin.dart';

/*class MiVentana extends StatelessWidget {
  const MiVentana({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Ventana_Almacen",
        debugShowCheckedModeBanner: false,
        home: Vista());
  }
}*/

class MiVentana extends StatefulWidget {
  const MiVentana({super.key});

  @override
  State<MiVentana> createState() => _VistaState();
}

class _VistaState extends State<MiVentana> {
  CdorAlmacenes cdorAlmacenes = CdorAlmacenes();
  TextEditingController idController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Almacenes"),
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),*/
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MiMenu()));
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        size: 35,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text("Almacenes",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black)),
                  ]),
              SizedBox(
                height: 30,
              ),
              Container(
                child: TextField(
                  controller: idController,
                  keyboardType: TextInputType.numberWithOptions(signed: true),
                  cursorColor: Colors.lightBlueAccent,
                  decoration: InputDecoration(
                      labelText: "Introduce ID Del Almacen",
                      labelStyle: TextStyle(fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: TextField(
                  controller: nombreController,
                  keyboardType: TextInputType.name,
                  cursorColor: Colors.lightBlueAccent,
                  decoration: InputDecoration(
                      labelText: "Introduce nombre del Almacen",
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
                      int id = int.parse(idController.text);
                      String nombre = nombreController.text;
                      cdorAlmacenes.AgregarAlmacen(id, nombre);

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
              Center(
              heightFactor: 8,
              child: Text(
                "ListView de Almacenes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
              /*SizedBox(
                height: 15,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                        ),
                        Icon(Icons.arrow_circle_right,
                        color: Color.fromARGB(255, 148, 41, 41),
                        ),
                        Text(
                          "  Ir a las Ventas",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                          textAlign: TextAlign.center,
                        )
                      ],
                    )),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
