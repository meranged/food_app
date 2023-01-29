import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  static const screenTitle = 'Favorites';
  final List<Meal> favList;
  FavoritesScreen(this.favList);

  @override
  Widget build(BuildContext context) {
    if (favList.isEmpty) {
      return Center(
          child: Text('The favorites list is empty, please add something!'));
    } else {
      return ListView.builder(
        itemBuilder: ((ctx, index) {
          return MealItem(
            id: favList[index].id,
            title: favList[index].title,
            imageUrl: favList[index].imageUrl,
            duration: favList[index].duration,
            complexity: favList[index].complexity,
            affordability: favList[index].affordability,
          );
        }),
        itemCount: favList.length,
      );
    }
  }
}
