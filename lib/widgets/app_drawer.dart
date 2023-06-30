import 'package:flutter/material.dart';
import 'package:control_de_gastos/pages/home_page.dart';
import 'package:control_de_gastos/pages/accounts_page.dart';
import 'package:control_de_gastos/pages/categories_page.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Gráfico'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: Text('Cuentas'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Categorías'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
