import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountsPage extends StatefulWidget {
  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  List<String> accounts = [];

  @override
  void initState() {
    super.initState();
    loadAccounts();
  }

  void loadAccounts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedAccounts = prefs.getStringList('accounts');
    setState(() {
      if (savedAccounts != null) {
        accounts = savedAccounts;
      }
    });
  }

  void saveAccounts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('accounts', accounts);
  }

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
                        saveAccounts(); // Guardar las cuentas actualizadas
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
        child: Icon(Icons.add),
      ),
    );
  }
}
