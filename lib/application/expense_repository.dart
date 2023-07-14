import '../domain/expense.dart';

abstract class ExpenseRepository {
  void saveExpense(Expense expense);
  List<Expense> getAllExpenses();
  // Otros métodos relacionados con la manipulación de gastos
}
