import 'package:control_de_gastos/bar_graph/individual_bar.dart';

class BarData {
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;
  final double sunAmount;

  BarData(
      {required this.monAmount,
      required this.tueAmount,
      required this.wedAmount,
      required this.thurAmount,
      required this.friAmount,
      required this.satAmount,
      required this.sunAmount});

  List<IndividualBar> barData = [];

  // Initialize bar data
  void initializeBarData() {
    barData = [
      // Monday
      IndividualBar(x: 0, y: monAmount),

      // Tuesday
      IndividualBar(x: 1, y: tueAmount),

      // Wednesday
      IndividualBar(x: 2, y: wedAmount),

      // Thursday
      IndividualBar(x: 3, y: thurAmount),

      // Friday
      IndividualBar(x: 4, y: friAmount),

      // Saturday
      IndividualBar(x: 5, y: satAmount),

      // Sunday
      IndividualBar(x: 6, y: sunAmount),
    ];
  }
}
