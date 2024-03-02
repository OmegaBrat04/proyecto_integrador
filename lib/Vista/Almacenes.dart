import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controlador/CdorAlmacenes.dart';
import 'package:proyecto_integrador/Controlador/CdorListarAlmacenes.dart';
import 'package:proyecto_integrador/Modelo/MAlmacenes.dart';
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
  final List<MAlmacenes> listaAlmacenes;
  const MiVentana({Key? key, required this.listaAlmacenes}) : super(key: key);

  @override
  State<MiVentana> createState() => _VistaState();
}

class _VistaState extends State<MiVentana> {
  bool isEditing = false;
  int editingIndex = -1;
  CdorAlmacenes cdorAlmacenes = CdorAlmacenes();
  TextEditingController idController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  ListarAlmacenes listarAlmacenes = ListarAlmacenes();
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
                    onPressed: () async {
                      int id = int.parse(idController.text);
                      String nombre = nombreController.text;
                      if (isEditing) {
                        await cdorAlmacenes.actualizarAlmacen(editingIndex, id, nombre);
                        /*var almacenActualizado = await Hive.box('almacenes').getAt(editingIndex);
                        print('Almacén actualizado: $almacenActualizado');*/
                        isEditing = false;
                        editingIndex = -1;
                      } else {
                        cdorAlmacenes.AgregarAlmacen(id, nombre);
                      }
                     idController.clear();
                     nombreController.clear();
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.save,
                      size: 50,
                      color: Color.fromARGB(255, 148, 41, 41),
                    ),
                  ),
                  /*IconButton(
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
                  )*/
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                child: ListView.builder(
                  itemCount: listarAlmacenes.mostrarAlmacenes().length,
                  itemBuilder: (context, index) {
                    var almacen = listarAlmacenes.mostrarAlmacenes()[index];
                    return ListTile(
                      leading: Text(almacen.id.toString()),
                      title: Text(almacen.nombre),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 28, 78, 28),
                          ),
                          onPressed: () {
                            var almacen =
                                listarAlmacenes.mostrarAlmacenes()[index];
                            setState(() {
                            idController.text = almacen.id.toString();
                            nombreController.text = almacen.nombre;
                            isEditing = true;
                            editingIndex = index;
                          
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: const Color.fromARGB(255, 94, 21, 21),
                          ),
                          onPressed: () {
                            /*var almacen =
                                listarAlmacenes.mostrarAlmacenes()[index];*/
                            cdorAlmacenes.eliminarAlmacen(index);
                            setState(() {});
                          },
                        ),
                      ]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
