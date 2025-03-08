import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../dummy_data.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;


  FavoritesScreen(this.favoriteMeals);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _toggleFavorite(String mealId) {
    final existingIndex = widget.favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        widget.favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        widget.favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite (String id) {
    return widget.favoriteMeals.any((meal) => meal.id == id);
  }
  @override
  Widget build(BuildContext context) {
    if(widget.favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: widget.favoriteMeals[index].id,
              title: widget.favoriteMeals[index].title,
              imageUrl: widget.favoriteMeals[index].imageUrl,
              duration: widget.favoriteMeals[index].duration,
              affordability: widget.favoriteMeals[index].affordability,
              complexity: widget.favoriteMeals[index].complexity,
              isFavorite: _isMealFavorite,
              toggleFavorite: _toggleFavorite,
            );
          },
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}
