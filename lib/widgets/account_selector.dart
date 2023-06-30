import 'package:flutter/material.dart';

class AccountSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Total'),
      subtitle: Text('Selecciona una cuenta'),
      trailing: Icon(Icons.keyboard_arrow_down),
      onTap: () {
        // Mostrar lista seleccionable de cuentas
      },
    );
  }
}
