import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  Function _toggleFav;
  Function _isMealFav;
  MealDetailScreen(this._toggleFav, this._isMealFav);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final Meal selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    Widget buildSectionTitle(BuildContext ctx, String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(ctx).textTheme.titleMedium,
        ),
      );
    }

    Widget buildContainer(Widget childWidget) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: childWidget,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
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
              itemBuilder: (context, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                );
              },
            ),
          ),
          buildSectionTitle(context, 'Steps'),
          buildContainer(ListView.builder(
            itemCount: selectedMeal.steps.length,
            itemBuilder: (ctx, index) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Text('# ${index + 1}')),
                  title: Text(selectedMeal.steps[index]),
                ),
                Divider(),
              ],
            ),
          )),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isMealFav(mealId) ? Icons.star : Icons.star_border),
        onPressed: () {
          _toggleFav(mealId);
        },
      ),
    );
  }
}
