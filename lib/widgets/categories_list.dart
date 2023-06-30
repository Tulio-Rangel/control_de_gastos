import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Categoría $index'),
            subtitle: Text('10% del total gastado'),
            leading: CircleAvatar(
              child: Text(index.toString()),
            ),
          );
        },
      ),
    );
  }
}
