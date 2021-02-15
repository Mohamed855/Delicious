import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../values.dart';
import '../widgets/mealsItem.dart';

class Meals extends StatefulWidget {
  @override
  _MealsState createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    final _routeArguments = ModalRoute.of(context).settings.arguments as Map;

    final categoryId = _routeArguments['id'];
    final categoryTitle = _routeArguments['title'];

    final List meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$categoryTitle Meals',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: lgSpace,
          left: space,
          right: space,
        ),
        child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (_, index) => MealsItem(
            id: meals[index].id,
            title: meals[index].title,
            imageUrl: meals[index].imageUrl,
            duration: meals[index].duration,
            affordability: meals[index].affordability,
            complexity: meals[index].complexity,
          ),
        ),
      ),
    );
  }
}
