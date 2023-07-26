import 'package:flutter/material.dart';

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
          title: Text('Add new expense'),
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
              child: Text('Save'),
            ),

            // Cancel button
            MaterialButton(
              onPressed: cancel,
              child: Text('Cancel'),
            ),
          ]),
    );
  }

  // Save
  void save() {}

  // Cancel
  void cancel() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: addNewExpense,
        child: const Icon(Icons.add),
      ),
    );
  }
}
