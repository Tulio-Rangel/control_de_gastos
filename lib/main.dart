import 'package:control_de_gastos/data/expense_data.dart';
import 'package:control_de_gastos/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ControlDeGastosApp());
}

class ControlDeGastosApp extends StatelessWidget {
  const ControlDeGastosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: ((context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blueGrey),
            home: const HomePage(),
          )),
    );
  }
}
