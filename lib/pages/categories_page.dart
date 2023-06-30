import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> expenseCategories = ['Categoría 1', 'Categoría 2'];
  List<String> incomeCategories = ['Categoría 3', 'Categoría 4'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorías'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Gastos'),
            Tab(text: 'Ingresos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            itemCount: expenseCategories.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(expenseCategories[index]),
              );
            },
          ),
          ListView.builder(
            itemCount: incomeCategories.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(incomeCategories[index]),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String newCategoryName = '';
              return AlertDialog(
                title: Text('Nueva Categoría'),
                content: TextField(
                  onChanged: (value) {
                    newCategoryName = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Nombre de la categoría',
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        if (_tabController.index == 0) {
                          expenseCategories.add(newCategoryName);
                        } else {
                          incomeCategories.add(newCategoryName);
                        }
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
        child: Text('Agregar Categoría'),
      ),
    );
  }
}
