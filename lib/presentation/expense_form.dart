import 'package:flutter/material.dart';
import '../domain/expense.dart';
import '../application/add_expense_use_case.dart';

class ExpenseForm extends StatelessWidget {
  final AddExpenseUseCase _addExpenseUseCase;

  ExpenseForm(this._addExpenseUseCase);

  final _formKey = GlobalKey<FormState>();
  double _amount = 0.0;
  final DateTime _date = DateTime.now();
  final String _category = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar gasto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Cantidad'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingresa una cantidad.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _amount = double.parse(value!);
                },
              ),
              // Otras entradas de formulario para la fecha y la categoría
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final expense = Expense(
                      amount: _amount,
                      date: _date,
                      category: _category,
                    );
                    _addExpenseUseCase.addExpense(expense);
                    Navigator.pop(context);
                  }
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
