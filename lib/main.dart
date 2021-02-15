import 'package:flutter/material.dart';

import 'home.dart';
import 'views/meals.dart';
import 'views/mealDetails.dart';
import 'views/filters.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrange,
          canvasColor: Color.fromRGBO(250, 250, 245, 1),
          shadowColor: Colors.black.withOpacity(0.8),
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 50.0,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.0,
                  shadows: [
                    Shadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                headline2: TextStyle(
                  color: Color.fromRGBO(250, 250, 245, 1),
                  fontSize: 30.0,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.0,
                ),
                headline3: TextStyle(
                  color: Color.fromRGBO(250, 250, 245, 1),
                  fontSize: 26.0,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1.5,
                ),
                headline4: TextStyle(
                  color: Color.fromRGBO(250, 250, 245, 1),
                  fontSize: 20.0,
                  fontFamily: 'RobotoCondensed',
                  letterSpacing: 1.0,
                ),
                headline5: TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 20.0,
                  fontFamily: 'RobotoCondensed',
                  letterSpacing: 1.0,
                ),
                headline6: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 20.0,
                  fontFamily: 'RobotoCondensed',
                  letterSpacing: 1.0,
                ),
                subtitle1: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  letterSpacing: 0.5,
                ),
                subtitle2: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  letterSpacing: 0.5,
                ),
                bodyText1: TextStyle(
                  color: Colors.black.withOpacity(0.8),
                  fontSize: 16.0,
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(250, 250, 245, 1),
                  fontSize: 16.0,
                ),
              ),
        ),
        home: Home(),
        routes: {
          '/meals': (context) => Meals(),
          '/mealDetails': (context) => MealDetails(),
          '/filters': (context) => Filters(),
        },
      );
}
