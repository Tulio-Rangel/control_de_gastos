import '../domain/expense.dart';
import '../application/expense_repository.dart';

class AddExpenseUseCase {
  final ExpenseRepository _repository;

  AddExpenseUseCase(this._repository);

  void addExpense(Expense expense) {
    // Lógica adicional, si es necesario
    _repository.saveExpense(expense);
  }
}
