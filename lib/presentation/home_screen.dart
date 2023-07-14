import 'package:flutter/material.dart';
import 'expense_list.dart';
import 'income_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ExpenseList(),
    IncomeList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control de Gastos'),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.money_off),
            label: 'Gastos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Ingresos',
          ),
        ],
      ),
    );
  }
}
