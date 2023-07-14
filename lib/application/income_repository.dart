import '../domain/income.dart';

abstract class IncomeRepository {
  void saveIncome(Income income);
  List<Income> getAllIncomes();
  // Otros métodos relacionados con la manipulación de ingresos
}

class IncomeRepositoryImpl implements IncomeRepository {
  List<Income> _incomes = [];

  @override
  void saveIncome(Income income) {
    _incomes.add(income);
  }

  @override
  List<Income> getAllIncomes() {
    return _incomes;
  }
}
