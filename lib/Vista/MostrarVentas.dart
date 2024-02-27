import 'package:flutter/material.dart';
void main() {
  runApp(MostrarV());
}
class MostrarV extends StatelessWidget {
  const MostrarV({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: VentasRlz(),
      title: "Ventas Hechas",
    );
  }
}
class VentasRlz extends StatefulWidget {
  const VentasRlz({super.key});

  @override
  State<VentasRlz> createState() => _VentasRlzState();
}

class _VentasRlzState extends State<VentasRlz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ventas Realizadas"),
      ),
    );
  }
}