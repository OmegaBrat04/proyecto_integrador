import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Almacenes.dart';

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
                  MaterialPageRoute(builder: (context)=>MiVentana())
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
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {   
                  },
                  child: Text('Agregar al carrito'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Escanear'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, 
              children: [
                ElevatedButton(
                  onPressed: () { 
                  },
                  child: Text('Eliminar del Carrito'),
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
                child: const Text('Pagar Total'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}