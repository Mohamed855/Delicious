import 'package:flutter/material.dart';

import '../values.dart';
import '../dummy_data.dart';
import '../widgets/categoryItem.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List categories = DUMMY_CATEGORIES;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpg',
                ),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.4),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Container(
              alignment: Alignment.centerRight,
              color: Colors.white.withOpacity(0.3),
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.only(right: lgSpace),
              child: Text(
                'Delicious',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(lgSpace),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: height,
                childAspectRatio: 3 / 2,
                mainAxisSpacing: lgSpace,
                crossAxisSpacing: lgSpace,
              ),
              itemCount: categories.length,
              itemBuilder: (_, index) => CategoryItem(
                categories[index].id,
                categories[index].title,
                categories[index].color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
