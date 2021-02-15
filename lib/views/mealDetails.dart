import 'package:flutter/material.dart';

import '../values.dart';
import '../dummy_data.dart';

class MealDetails extends StatefulWidget {
  @override
  _MealDetailsState createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  bool isFavorite = false;
  Widget subTitle(BuildContext context, String text) => Padding(
        padding: EdgeInsets.symmetric(vertical: space),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      );

  Widget sectionView(BuildContext context, {@required ListView childList}) =>
      Container(
        height: 200.0,
        width: 300.0,
        padding: EdgeInsets.all(space),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(color: Theme.of(context).shadowColor)),
        child: childList,
      );

  @override
  Widget build(BuildContext context) {
    final _mealId = ModalRoute.of(context).settings.arguments as String;
    final _mealDetails = DUMMY_MEALS.firstWhere((meal) => meal.id == _mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _mealDetails.title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: lgSpace),
          child: Column(
            children: [
              Container(
                height: 300.0,
                width: double.infinity,
                child: FadeInImage(
                  image: NetworkImage(
                    _mealDetails.imageUrl,
                  ),
                  // default image if there is any error - no internet connection
                  placeholder: AssetImage(
                    'assets/images/default.jpg',
                  ),
                  height: 220.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              subTitle(context, 'Ingredients'),
              sectionView(
                context,
                childList: ListView.builder(
                  itemCount: _mealDetails.ingredients.length,
                  itemBuilder: (_, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: EdgeInsets.all(space),
                      child: Text(
                        _mealDetails.ingredients[index],
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ),
                ),
              ),
              subTitle(context, 'Steps'),
              sectionView(
                context,
                childList: ListView.builder(
                  itemCount: _mealDetails.steps.length,
                  itemBuilder: (_, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).accentColor,
                          child: Text(
                            '# ${index + 1}',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                        title: Text(
                          _mealDetails.steps[index],
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Divider(
                        color: Theme.of(context).accentColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFavorite == true ? Icon(Icons.star) : Icon(Icons.star_border),
        onPressed: () {
          setState(() =>
              isFavorite == false ? isFavorite = true : isFavorite = false);
        },
      ),
    );
  }
}
