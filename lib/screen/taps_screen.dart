// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mealappflutter/category.dart';
import 'package:mealappflutter/screen/catagories_screen.dart';
import 'package:mealappflutter/screen/favorite.dart';

class TapScreen extends StatefulWidget {
  const TapScreen({Key? key}) : super(key: key);

  @override
  State<TapScreen> createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  final List<Map<String, dynamic>> pages = [
    {'page': CatagoriesScreen(), 'title': 'categories'},
    {'page': Favorite(), 'title': 'favorities'},
  ];
  int selectedpageindex = 0;
  void _selectPage(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(pages[selectedpageindex]['title']),
        ),
        drawer: Drawer(
          child: Text('drawer'),
        ),
        body: pages[selectedpageindex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Colors.amber,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'favorite',
            ),
          ],
        ),
      ),
    );
  }
}
