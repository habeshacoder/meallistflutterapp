// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mealappflutter/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.id,
    required this.title,
    required this.duration,
    required this.affordability,
    required this.complexity,
    required this.imageurl,
  });
  String get complexitytext {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
        break;
      case Complexity.Hard:
        return 'hard';
        break;
      case Complexity.Challenging:
        return 'challenging';
        break;
      default:
        return 'unknown';
    }
  }

  String get affordtext {
    switch (affordability) {
      case Affordability.Affordable:
        return 'affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'unknown';
    }
  }

  void Showdetails(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/mealdetailsscreen',
      arguments: {
        'id': id,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Showdetails(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 13,
                  left: 10,
                  child: Container(
                    width: 320,
                    padding: EdgeInsets.all(25),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexitytext),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordtext),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
