import 'package:control_de_gastos/infrastructure/models/expense_item.dart';

class ExpeseData {
  // List of all exprenses
  List<ExpenseItem> expensesList = [];

  // Retireve all the expenses
  List<ExpenseItem> getTxpensesList() {
    return expensesList;
  }

  // Add new expense
  void addNewExpense(ExpenseItem newExpense) {
    expensesList.add(newExpense);
  }

  void deleteExpense(ExpenseItem expense) {
    expensesList.remove(expense);
  }

  void updateExpense(ExpenseItem expense, String newDetail, String newAmount,
      DateTime newDateTime) {
    final index = expensesList.indexOf(expense);

    if (index >= 0) {
      // Create a new Expense object with updated values
      final updatedExpense = ExpenseItem(
        detail: newDetail,
        amount: newAmount,
        dateTime: newDateTime,
      );
      expensesList[index] = updatedExpense;
    }
  }
}
