import 'package:control_de_gastos/datetime/date_time_helper.dart';
import 'package:control_de_gastos/models/expense_item.dart';

class ExpenseData {
  // List of All expenses
  List<ExpenseItem> overallExpenseList = [];

  // Gewet Expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  // Add new expense
  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
  }

  // Delete expense
  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
  }

  // Get weekday (mon, tues, etc) from a dateTime object
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  // Get the date for start of the week (monday)
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    // Get today's date
    DateTime today = DateTime.now();

    // Go backwards from today to find monday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Mon') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  /**
   * Convert overall lista of expenses into a daily exoense sumary
   * 
   * e.g
   * 
   * overallExpenseList = [
   * 
   * [food, 2023/01/30, $10],
   * [game, 2023/01/30, $100],
   * [bill, 2023/02/14, $30],
   * [phone, 2023/02/21, $600],
   * [phone, 2023/02/21, $200],
   * [phone, 2023/02/21, $300],
   * 
   * ]
   * 
   * ->
   * 
   * DailyExpenseSumary = [
   * 
   * [2023/01/10: $110],
   * [2023/02/14: $30],
   * [2023/02/21: $1100]
   * 
   * ]
   * 
   */
  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {
      // Date (yyyymmdd) : amountTotalForDay
    };

    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}
