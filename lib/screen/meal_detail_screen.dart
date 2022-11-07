// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mealappflutter/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  Widget buildertitle(BuildContext context, String text) {
    return Container(
      width: 300,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text),
    );
  }

  Widget buildcontainer(Widget child) {
    return Container(
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routarg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final id = routarg['id'];
    final selectedmeal = DUMMY_MEALS.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedmeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // decoration: BoxDecoration(color: Colors.),
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedmeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildertitle(context, 'ingridient'),
            buildcontainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Colors.grey[500],
                  child: Text(
                    selectedmeal.ingredients[index],
                  ),
                ),
                itemCount: selectedmeal.ingredients.length,
              ),
            ),
            buildertitle(context, 'steps'),
            buildcontainer(
              ListView.builder(
                itemBuilder: (context, index) => Column(children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      selectedmeal.steps[index],
                    ),
                  ),
                  Divider(),
                ]),
                itemCount: selectedmeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
