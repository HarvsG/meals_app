import 'package:flutter/material.dart';
import './category_meals_screen.dart';
//import 'package:meals_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({@required this.title, @required this.color, @required this.id});

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(
        builder: (_) {
          return CategoryMealsScreen(categoryId: id,categoryTitle: title,);
        },
        fullscreenDialog: false));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
