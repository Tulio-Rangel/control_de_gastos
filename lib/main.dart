import 'package:flutter/material.dart';
import 'presentation/home_screen.dart';

void main() {
  runApp(ControlDeGastosApp());
}

class ControlDeGastosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
