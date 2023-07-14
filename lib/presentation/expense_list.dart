import 'package:flutter/material.dart';
import '../domain/expense.dart';
import '../application/expense_repository.dart';

class ExpenseList extends StatelessWidget {
  final ExpenseRepository _expenseRepository;

  ExpenseList(this._expenseRepository);

  @override
  Widget build(BuildContext context) {
    final expenses = _expenseRepository.getAllExpenses();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de gastos'),
      ),
      body: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) {
          final expense = expenses[index];
          return ListTile(
            title: Text('Cantidad: ${expense.amount}'),
            subtitle: Text('Fecha: ${expense.date.toString()}'),
            trailing: Text('Categoría: ${expense.category}'),
          );
        },
      ),
    );
  }
}
