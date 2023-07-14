import '../domain/income.dart';

abstract class IncomeRepository {
  void saveIncome(Income income);
  List<Income> getAllIncomes();
  // Otros métodos relacionados con la manipulación de ingresos
}
