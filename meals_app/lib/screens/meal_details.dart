import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal-details';

  final Function isFavorite;
  final Function toggleFavorite;


  MealDetails(this.isFavorite, this.toggleFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  Widget _buildRelatedMeals(BuildContext context, dynamic meal) {
    final relatedMeals = DUMMY_MEALS.where((m) =>
    m.id != meal.id &&
        m.categories.any((catId) => meal.categories.contains(catId))
    ).take(3).toList();

    // If no related meals found, get random meals
    if (relatedMeals.isEmpty) {
      var randomMeals = DUMMY_MEALS.where((m) => m.id != meal.id).take(3).toList();
      return _buildMealsList(context, randomMeals);
    }

    return _buildMealsList(context, relatedMeals);
  }

// Helper method to build the actual UI
  Widget _buildMealsList(BuildContext context, List relatedMeals) {
    if (relatedMeals.isEmpty) {
      return Center(child: Text("No related meals found"));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: relatedMeals.map((relatedMeal) =>
          GestureDetector(
            onTap: () => Navigator.of(context).pushReplacementNamed(
                MealDetails.routeName,
                arguments: relatedMeal.id
            ),
            child: Card(
              margin: EdgeInsets.all(8),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Container(
                width: 110,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.network(
                        relatedMeal.imageUrl,
                        height: 80,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        relatedMeal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ).toList(),
    );
  }


  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealID);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.secondary.withOpacity(0.7),
                          Theme.of(context).colorScheme.secondary,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: Icon(
                          Icons.restaurant_menu,
                          color: Colors.blueGrey,
                        ),
                      ),
                      title: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      Card(
                        elevation: 2,
                        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            child: Text('${(index + 1)}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                      ),
                      if (index < selectedMeal.steps.length - 1)
                        Divider(color: Colors.grey.withOpacity(0.3)),
                    ],
                  ),
                )
            ),
            buildSectionTitle(context, 'You Might Also Like'),
            Container(
              height: 150,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: _buildRelatedMeals(context, selectedMeal),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealID) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealID),
      ),
    );
  }
}
