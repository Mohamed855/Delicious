import 'package:flutter/material.dart';

import 'widgets/mainDrawer.dart';
import 'widgets/bottomNavBar.dart';
import 'views/categories.dart';
import 'views/favoriteMeals.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List homeContent = [
    {
      'title': 'Categories',
      'content': Categories(),
    },
    {
      'title': 'Favorites',
      'content': FavoriteMeals(),
    },
  ];

  int selectedPart = 0;
  void changeHomeContent(int idx) => setState(() => selectedPart = idx);

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            homeContent[selectedPart]['title'],
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        body: homeContent[selectedPart]['content'],
        drawer: MainDrawer(),
        bottomNavigationBar: BottomNavBar(selectedPart, changeHomeContent),
      ));
}
