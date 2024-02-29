import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controlador/CdorAgProductos.dart';
import 'package:proyecto_integrador/Controlador/CdorListarProductos.dart';
import 'package:proyecto_integrador/Modelo/MProductos.dart';
import 'package:proyecto_integrador/Vista/MenuPrin.dart';

class Productos extends StatefulWidget {
  final List<Producto> listaProductos;
  Productos({Key? key, required this.listaProductos}) : super(key: key);

  @override
  _ProductosState createState() => _ProductosState();
}

class _ProductosState extends State<Productos> {
  final AgregarProductos agregarProductos = AgregarProductos();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController precioController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final ListarProductos listarProductos = ListarProductos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MenuPrincipal()));
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: 35,
                      color: Colors.black,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  const Text(
                    "Productos",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: TextField(
                        controller: idController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "ID del producto",
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: TextField(
                        controller: nombreController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Nombre del producto",
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: TextField(
                        controller: precioController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Precio del producto",
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: TextField(
                        controller: stockController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Stock del producto",
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    ),
                  ))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      items: <String>[
                        'Almacen 1',
                        'Almacen 2',
                        'Almacen 3',
                        'Almacen 4'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String) {},
                      hint: Text(
                        'Selecciona un Almacen  ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      icon: Icon(
                        Icons.add_business_outlined,
                        size: 30,
                        color: Colors.black87,
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
                      alignment: Alignment.centerRight,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      int id = int.parse(idController.text);
                      String nombre = nombreController.text;
                      double precio = double.parse(precioController.text);
                      int stock = int.parse(stockController.text);
                      agregarProductos.agregarProducto(
                          id, nombre, precio, stock);
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
              SizedBox(
                height: 18,
              ),
              Container(
                height: MediaQuery.of(context).size.height *
                    0.5, // Ajusta esto según tus necesidades
                child: ListView.builder(
                  itemCount: listarProductos.mostrarProductos().length,
                  itemBuilder: (context, index) {
                    var producto = listarProductos.mostrarProductos()[index];
                    return ListTile(
                      leading: Text(producto.id.toString()),
                      title: Text(producto.nombre),
                      subtitle: Text(producto.precio.toString()),
                      trailing: Text(producto.stock.toString()),
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
