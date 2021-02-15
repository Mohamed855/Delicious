import 'package:flutter/material.dart';

import '../values.dart';
import '../models/meal.dart';

class MealsItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  MealsItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.affordability,
    @required this.complexity,
  });

  get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
    }
  }

  get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
    }
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/mealDetails',
            arguments: id,
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 4.0,
          margin: EdgeInsets.only(
            bottom: lgSpace,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                    child: FadeInImage(
                      image: NetworkImage(imageUrl),
                      // default image if there is any error - no internet connection
                      placeholder: AssetImage(
                        'assets/images/default.jpg',
                      ),
                      height: 220.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: lgSpace,
                    right: space,
                    child: Container(
                      width: 300.0,
                      padding: EdgeInsets.symmetric(
                        vertical: minSpace,
                        horizontal: lgSpace,
                      ),
                      color: Colors.black54,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.subtitle1,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: lgSpace),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.schedule,
                          color: Theme.of(context).accentColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: minSpace),
                          child: Text(
                            '$duration min',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.work,
                          color: Theme.of(context).accentColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: minSpace),
                          child: Text(
                            '$complexityText',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: Theme.of(context).accentColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: minSpace),
                          child: Text(
                            '$affordabilityText',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
