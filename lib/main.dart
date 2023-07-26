import 'package:control_de_gastos/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ControlDeGastosApp());
}

class ControlDeGastosApp extends StatelessWidget {
  const ControlDeGastosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blueGrey),
      home: const HomePage(),
    );
  }
}
