import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controlador/CdorProductos.dart';
import 'package:proyecto_integrador/Controlador/CdorVenta.dart';
import 'package:proyecto_integrador/Modelo/MProductos.dart';
import 'package:proyecto_integrador/Vista/MenuPrin.dart';
import 'package:proyecto_integrador/Modelo/MListaVentas.dart';

class VentanaVenta extends StatefulWidget {
  @override
  _VentanaVentaState createState() => _VentanaVentaState();
}

class _VentanaVentaState extends State<VentanaVenta> {
  final TextEditingController codigoController = TextEditingController();
  final CdorVenta controladorVenta = CdorVenta();

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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MiMenu()));
                  },
                ),
              ],
            ),
            SizedBox(height: 16),
            const Text('Código'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: codigoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 6.0)),
                        hintText: "Agrega el carrito",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
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
                    int id = int.parse(codigoController.text);
                    Producto producto =
                        AgregarProductos().obtenerProductoPorId(id);
                    controladorVenta.agregarAlCarrito(producto, 1);
                    setState(() {
                      codigoController.clear();
                    });
                  },
                  child: Text(
                    'Agregar al carrito',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    int id = int.parse(codigoController.text);
                    Venta venta = controladorVenta.carrito
                        .firstWhere((venta) => venta.producto.id == id);
                    controladorVenta.eliminarDelCarrito(venta);
                    setState(() {
                      codigoController.clear();
                    });
                  },
                  child: Text('Eliminar del Carrito',
                      style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    elevation: 3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: controladorVenta.carrito.length,
                itemBuilder: (context, index) {
                  final venta = controladorVenta.carrito[index];
                  return ListTile(
                    leading: Text(venta.producto.id.toString()),
                    title: Text(venta.producto.nombre),
                    subtitle: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            controladorVenta.actualizarCantidad(venta, venta.cantidad - 1);
                            setState(() {});
                          },
                        ),
                        Text(venta.cantidad.toString()),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            controladorVenta.actualizarCantidad(venta, venta.cantidad + 1);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    trailing: Text(venta.subtotal.toString()),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  double total = controladorVenta.calcularTotal();
                  controladorVenta.realizarVenta();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Total'),
                        content: Text('El total a pagar es: $total'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cerrar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child:
                    Text('Pagar Total', style: TextStyle(color: Colors.black)),
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
