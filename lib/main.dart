import 'package:flutter/material.dart';
import 'presentation/expense_form.dart';
import 'presentation/expense_list.dart';
import 'presentation/income_form.dart';
import 'presentation/income_list.dart';
import 'application/add_expense_use_case.dart';
import 'application/add_income_use_case.dart';
import 'application/expense_repository.dart';
import 'application/income_repository.dart';

void main() {
  runApp(ControlDeGastosApp());
}

class ControlDeGastosApp extends StatelessWidget {
  final ExpenseRepository _expenseRepository = ExpenseRepositoryImpl();
  final AddExpenseUseCase _addExpenseUseCase =
      AddExpenseUseCase(ExpenseRepositoryImpl());

  final IncomeRepository _incomeRepository = IncomeRepositoryImpl();
  final AddIncomeUseCase _addIncomeUseCase =
      AddIncomeUseCase(IncomeRepositoryImpl());

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
        '/incomeForm': (ctx) => IncomeForm(_addIncomeUseCase),
      },
    );
  }
}
