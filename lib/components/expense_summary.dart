import 'package:control_de_gastos/bar_graph/bar_graph.dart';
import 'package:control_de_gastos/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/expense_data.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startOfWeek;

  const ExpenseSummary({super.key, required this.startOfWeek});

  @override
  Widget build(BuildContext context) {
    // Get yyyymmdd for each day of this week
    String monday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 0)));
    String tuesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 1)));
    String wednesday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 2)));
    String thursday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 3)));
    String friday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 4)));
    String saturday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 5)));
    String sunday =
        convertDateTimeToString(startOfWeek.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(builder: (context, value, child) {
      // Calculate the total amount for the week
      double calculatedMaxY = [
        value.calculateDailyExpenseSummary()[monday] ?? 0,
        value.calculateDailyExpenseSummary()[tuesday] ?? 0,
        value.calculateDailyExpenseSummary()[wednesday] ?? 0,
        value.calculateDailyExpenseSummary()[thursday] ?? 0,
        value.calculateDailyExpenseSummary()[friday] ?? 0,
        value.calculateDailyExpenseSummary()[saturday] ?? 0,
        value.calculateDailyExpenseSummary()[sunday] ?? 0,
      ].reduce((value, element) => value + element);
      return SizedBox(
        height: 200,
        child: MyBarGraph(
            monAmount: value.calculateDailyExpenseSummary()[monday] ?? 0,
            tueAmount: value.calculateDailyExpenseSummary()[tuesday] ?? 0,
            wedAmount: value.calculateDailyExpenseSummary()[wednesday] ?? 0,
            thurAmount: value.calculateDailyExpenseSummary()[thursday] ?? 0,
            friAmount: value.calculateDailyExpenseSummary()[friday] ?? 0,
            satAmount: value.calculateDailyExpenseSummary()[saturday] ?? 0,
            sunAmount: value.calculateDailyExpenseSummary()[sunday] ?? 0,
            maxY: calculatedMaxY),
      );
    });
  }
}
