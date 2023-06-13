import 'package:coffee_masters/datamanager.dart';
import 'package:coffee_masters/datamodel.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataManager().getMenu(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var categories = snapshot.data! as List<Category>;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(categories[index].name),
              );
            },
          );
        } else {
          return Text("Loading...");
        }
      },
    );
  }
}
