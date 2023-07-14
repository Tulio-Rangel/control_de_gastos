import '../domain/income.dart';
import '../application/income_repository.dart';

class AddIncomeUseCase {
  final IncomeRepository _repository;

  AddIncomeUseCase(this._repository);

  void addIncome(Income income) {
    // Lógica adicional, si es necesario
    _repository.saveIncome(income);
  }
}
