import 'package:flutter/material.dart';
import 'package:control_de_gastos/widgets/app_drawer.dart';
import 'package:control_de_gastos/widgets/account_selector.dart';
import 'package:control_de_gastos/widgets/expenses_income_summary.dart';
import 'package:control_de_gastos/widgets/categories_list.dart';
import 'package:control_de_gastos/pages/transactions_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control de Gastos'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          AccountSelector(),
          ExpensesIncomeSummary(),
          CategoriesList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransactionsPage()),
          );
        },
      ),
    );
  }
}
