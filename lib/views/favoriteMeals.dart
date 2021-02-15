import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../values.dart';
import '../widgets/mealsItem.dart';

class FavoriteMeals extends StatelessWidget {
  Widget build(BuildContext context) {
    final List meals = DUMMY_MEALS;

    return Scaffold(
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
