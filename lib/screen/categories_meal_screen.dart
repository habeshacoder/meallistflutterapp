// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:mealappflutter/dummy_data.dart';
import 'package:mealappflutter/widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String id;
  // final String title;
  // CategoryMealScreen(this.id, this.title);
  @override
  Widget build(BuildContext context) {
    final routarg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final title = routarg['title'];
    final id = routarg['id'];
    final categoryMeals = DUMMY_MEALS
        .where(
          (meal) => meal.Categories.contains(id),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      // ignore: prefer_const_constructors
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              duration: categoryMeals[index].duration,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              imageurl: categoryMeals[index].imageUrl);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
