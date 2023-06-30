import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  String selectedType = 'Gasto';
  String selectedAccount = 'Cuenta 1';
  String selectedCategory = 'Categoría 1';
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transacciones'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Tipo:'),
                SizedBox(width: 10),
                DropdownButton(
                  value: selectedType,
                  items: [
                    DropdownMenuItem(
                      value: 'Gasto',
                      child: Text('Gasto'),
                    ),
                    DropdownMenuItem(
                      value: 'Ingreso',
                      child: Text('Ingreso'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedType = value.toString();
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Monto:'),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Cuenta:'),
                SizedBox(width: 10),
                DropdownButton(
                  value: selectedAccount,
                  items: [
                    DropdownMenuItem(
                      value: 'Cuenta 1',
                      child: Text('Cuenta 1'),
                    ),
                    DropdownMenuItem(
                      value: 'Cuenta 2',
                      child: Text('Cuenta 2'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedAccount = value.toString();
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Categoría:'),
                SizedBox(width: 10),
                DropdownButton(
                  value: selectedCategory,
                  items: [
                    DropdownMenuItem(
                      value: 'Categoría 1',
                      child: Text('Categoría 1'),
                    ),
                    DropdownMenuItem(
                      value: 'Categoría 2',
                      child: Text('Categoría 2'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value.toString();
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Fecha:'),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2025),
                    ).then((value) {
                      setState(() {
                        if (value != null) selectedDate = value;
                      });
                    });
                  },
                  child: Text(selectedDate.toString()),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Guardar la transacción
                Navigator.pop(context);
              },
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
