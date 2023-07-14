import 'package:flutter/material.dart';
import '../domain/income.dart';
import '../application/income_repository.dart';

class IncomeList extends StatelessWidget {
  final IncomeRepository _incomeRepository;

  IncomeList(this._incomeRepository);

  @override
  Widget build(BuildContext context) {
    final incomes = _incomeRepository.getAllIncomes();

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de ingresos'),
      ),
      body: ListView.builder(
        itemCount: incomes.length,
        itemBuilder: (ctx, index) {
          final income = incomes[index];
          return ListTile(
            title: Text('Cantidad: ${income.amount}'),
            subtitle: Text('Fecha: ${income.date.toString()}'),
            trailing: Text('Categoría: ${income.category}'),
          );
        },
      ),
    );
  }
}
