import 'package:flutter/material.dart';

class AccountsPage extends StatefulWidget {
  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  List<String> accounts = ['Cuenta 1', 'Cuenta 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuentas'),
      ),
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(accounts[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newAccountName = '';
              return AlertDialog(
                title: Text('Nueva Cuenta'),
                content: TextField(
                  onChanged: (value) {
                    newAccountName = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Nombre de la cuenta',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        accounts.add(newAccountName);
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Agregar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancelar'),
                  ),
                ],
              );
            },
          );
        },
        child: Text('Agregar Cuenta'),
      ),
    );
  }
}
