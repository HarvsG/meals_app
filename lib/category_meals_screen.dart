import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Category name')),
        body: Center(
          child: Text('The recipies for the category'),
        ));
  }
}
