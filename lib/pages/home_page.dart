import 'package:control_de_gastos/components/expense_summary.dart';
import 'package:control_de_gastos/components/expense_tile.dart';
import 'package:control_de_gastos/data/expense_data.dart';
import 'package:control_de_gastos/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text controlles
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Prepare data on startup
    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  // Add new expense
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: const Text('Add new expense'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Expense name
              TextField(
                controller: newExpenseNameController,
                decoration: const InputDecoration(hintText: 'Expense name'),
              ),

              // Expense amount
              TextField(
                controller: newExpenseAmountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Expense amount'),
              )
            ],
          ),
          actions: [
            // Save button
            MaterialButton(
              onPressed: save,
              child: const Text('Save'),
            ),

            // Cancel button
            MaterialButton(
              onPressed: cancel,
              child: const Text('Cancel'),
            ),
          ]),
    );
  }

  // Save
  void save() {
    // Create expense item
    ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: newExpenseAmountController.text,
        dateTime: DateTime.now());

    // Add the new expense
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);

    // Close the add expense dialog
    Navigator.pop(context);
    clear();
  }

  // Delete exoense
  void deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  // Cancel
  void cancel() {}

  // Clrear controllers
  void clear() {
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          child: const Icon(Icons.add),
        ),
        body: ListView(
          children: [
            // Weekly summary
            ExpenseSummary(startOfWeek: value.startOfWeekDate()),

            const SizedBox(
              height: 20,
            ),

            // Expense list
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.getAllExpenseList().length,
                itemBuilder: (context, index) => ExpenseTile(
                      name: value.getAllExpenseList()[index].name,
                      amount: value.getAllExpenseList()[index].amount,
                      dateTime: value.getAllExpenseList()[index].dateTime,
                      deleteTapped: (p0) =>
                          deleteExpense(value.getAllExpenseList()[index]),
                    )),
          ],
        ),
      ),
    );
  }
}
