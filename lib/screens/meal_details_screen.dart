import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  //const MealDetailScreen({Key key}) : super(key: key);
  static const routeName = '/media-detail';

  Widget buildSectionTitile(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer({Widget child}) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final String _mealId = ModalRoute.of(context).settings.arguments as String;
    final Meal _selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == _mealId);

    return Scaffold(
      appBar: AppBar(title: Text('${_selectedMeal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(_selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTitile(context, 'Ingredients'),
            buildContainer(
              child: ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(_selectedMeal.ingredients[index]),
                        ),
                      ),
                  itemCount: _selectedMeal.ingredients.length),
            ),
            buildSectionTitile(context, 'Steps'),
            buildContainer(
                child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(_selectedMeal.steps[index]),
                  ),
                  Divider(),
                ],
              ),
              itemCount: _selectedMeal.steps.length,
            ))
          ],
        ),
      ),
    );
  }
}
