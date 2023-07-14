import 'package:flutter/material.dart';
import 'presentation/expense_form.dart';
import 'presentation/expense_list.dart';
import 'application/add_expense_use_case.dart';
import 'application/expense_repository.dart';

void main() {
  runApp(ControlDeGastosApp());
}

class ControlDeGastosApp extends StatelessWidget {
  final ExpenseRepository _expenseRepository = ExpenseRepositoryImpl();
  final AddExpenseUseCase _addExpenseUseCase =
      AddExpenseUseCase(ExpenseRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExpenseList(_expenseRepository),
      routes: {
        '/expenseForm': (ctx) => ExpenseForm(_addExpenseUseCase),
      },
    );
  }
}
