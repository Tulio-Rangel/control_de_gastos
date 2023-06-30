import 'package:flutter/material.dart';

class ExpensesIncomeSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('Gastos necesarios'),
        subtitle: Text('20% del total gastado'),
        leading: Icon(Icons.money_off),
      ),
    );
  }
}
