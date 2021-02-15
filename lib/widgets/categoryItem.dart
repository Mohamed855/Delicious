import 'package:flutter/material.dart';

import '../values.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(
    this.id,
    this.title,
    this.color,
  );

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          '/meals',
          arguments: {
            'id': id,
            'title': title,
          },
        ),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                color.withOpacity(0.6),
                color,
              ],
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      );
}
