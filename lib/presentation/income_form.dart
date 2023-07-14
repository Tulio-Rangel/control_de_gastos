import 'package:flutter/material.dart';
import '../domain/income.dart';
import '../application/add_income_use_case.dart';

class IncomeForm extends StatelessWidget {
  final AddIncomeUseCase _addIncomeUseCase;

  IncomeForm(this._addIncomeUseCase);

  final _formKey = GlobalKey<FormState>();
  double _amount = 0.0;
  DateTime _date = DateTime.now();
  String _category = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar ingreso'),
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
                    final income = Income(
                      amount: _amount,
                      date: _date,
                      category: _category,
                    );
                    _addIncomeUseCase.addIncome(income);
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
