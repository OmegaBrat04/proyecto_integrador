import 'package:flutter/material.dart';
import 'package:proyecto_integrador/MenuPrin.dart';
void main() {
  runApp(A_Prod());
}

class A_Prod extends StatelessWidget {
  const A_Prod({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Productos(),
      debugShowCheckedModeBanner: false,
      title: "Productos",
    );
  }
}

class Productos extends StatefulWidget {
  const Productos({super.key});

  @override
  State<Productos> createState() => _ProductosState();
}

class _ProductosState extends State<Productos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10.00),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {

                    Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>MenuPrincipal())
                  );

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
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: TextField(
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
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Cantidad del producto",
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 2)),
                  ),
                ))
              ],
            ),
            SizedBox(
              height: 15,
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Guardar",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Eliminar",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Editar",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Center(
              heightFactor: 8,
              child: Text(
                "ListView de Productos",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
