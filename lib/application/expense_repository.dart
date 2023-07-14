import '../domain/expense.dart';

abstract class ExpenseRepository {
  void saveExpense(Expense expense);
  List<Expense> getAllExpenses();
  // Otros métodos relacionados con la manipulación de gastos
}

class ExpenseRepositoryImpl implements ExpenseRepository {
  List<Expense> _expenses = [];

  @override
  void saveExpense(Expense expense) {
    _expenses.add(expense);
  }

  @override
  List<Expense> getAllExpenses() {
    return _expenses;
  }
}
