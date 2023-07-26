import 'package:flutter/material.dart';

void main() {
  runApp(ControlDeGastosApp());
}

class ControlDeGastosApp extends StatelessWidget {
  const ControlDeGastosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ControlDeGastosApp(),
    );
  }
}
