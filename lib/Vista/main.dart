import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Vista/MenuPrin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VentanaVenta(),
    );
  }
}

class VentanaVenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ventana Carrito'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: ()
                   {  
                      Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>MiMenu())
                  );
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            const Text('Código'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Expanded(
                  child: const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 6.0)
                      ),
                      hintText: "Agrega el carrito",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      )
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: const CircleBorder(
                          side: BorderSide(
                            color: Color.fromARGB(255, 230, 35, 116),
                            width: 1,
                          ),
                        ),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(8),
                      ),
                      child: const Icon(
                        size: 30,
                        Icons.add,
                        color: Color.fromARGB(255, 27, 39, 202),
                      ),
                    ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {   
                  },
                  child: Text('Agregar al carrito', style: TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                  ),
                ),
                ElevatedButton(
                  onPressed: () { 
                  },
                  child: Text('Eliminar del Carrito', style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Carrito'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () { 
                  },
                  child: Text('Pagar Total', style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}