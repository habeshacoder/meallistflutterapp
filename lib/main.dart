// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mealappflutter/screen/catagories_screen.dart';
import 'package:mealappflutter/screen/categories_meal_screen.dart';
import 'package:mealappflutter/screen/meal_detail_screen.dart';
import 'package:mealappflutter/screen/taps_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DELIMEAL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TapScreen(),
      initialRoute: '/',
      routes: {
        // ignore: prefer_const_constructors
        // '/': (context) => TapScreen(),
        '/categorymeal': (context) => CategoryMealScreen(),
        '/mealdetailsscreen': (context) => MealDetailScreen(),
      },
    );
  }
}
