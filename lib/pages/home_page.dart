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
              ),

              // Expense amount
              TextField(
                controller: newExpenseAmountController,
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
        body: ListView.builder(
            itemCount: value.getAllExpenseList().length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(value.getAllExpenseList()[index].name),
                  subtitle: Text(
                      value.getAllExpenseList()[index].dateTime.toString()),
                  trailing:
                      Text('\$${value.getAllExpenseList()[index].amount}'),
                )),
      ),
    );
  }
}
