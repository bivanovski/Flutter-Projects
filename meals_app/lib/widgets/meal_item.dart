import 'package:flutter/material.dart';
import 'package:meals_app/screens/meal_details.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function isFavorite;
  final Function toggleFavorite;

  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isFavorite,
    required this.toggleFavorite,
  });

  void selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetails.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
    ),
    elevation: 4,
    margin: EdgeInsets.all(10),
    child: Column(
    children: <Widget>[
    Stack (
    children: <Widget>[
    ClipRRect(
    borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(15),
    topRight: Radius.circular(15),
    ),
    child: Image.network(
    imageUrl,
    height: 250,
    width: double.infinity,
    fit: BoxFit.cover,
    ),
    ),
    Positioned(
    bottom: 20,
    right: 10,
    child: Container(
    width: 300,
    color: Colors.black54,
    padding: EdgeInsets.symmetric(
    vertical: 5,
    horizontal: 20,
    ),
    child: Text(
    title,
    style: const TextStyle(
    fontSize: 26,
    color: Colors.white,
    ),
    softWrap: true,
    overflow: TextOverflow.fade,
    ),
    ),
    ),
    Positioned(
    bottom: 14,
    right: 0,
    child:
    MaterialButton(
    onPressed: () => toggleFavorite(id),
    color: Colors.white,
    textColor: Colors.pinkAccent,
    child: Icon(
    isFavorite(id) ? Icons.star : Icons.star_border, size: 30,),
    padding: const EdgeInsets.all(10),
    shape: const CircleBorder(),
    )
    ),
    ],
    ),
    Padding(
    padding: const EdgeInsets.all(20),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
    Row(
    children: <Widget>[
    const Icon(
    Icons.schedule,
    ),
    const SizedBox(
    width: 6,
    ),
    Text('$duration min'),
    ],
    ),
    Row(
    children: <Widget>[
    const Icon(
    Icons.work,
    ),
    const SizedBox(
    width: 6,
    ),
    Text(complexity.toString().split('.').last),
    ],
    ),
    Row(
    children: <Widget>[
    const Icon(
    Icons.attach_money,
    ),
    const SizedBox(
    width: 6,
    ),
    Text(affordability.toString().split('.').last),
    ],
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    );
  }
}
