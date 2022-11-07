// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mealappflutter/widgets/categories_item.dart';
import 'package:mealappflutter/category.dart';
import '../dummy_data.dart';

class CatagoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (catdata) => CategoryItem(
              catdata.id,
              catdata.title,
              catdata.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
