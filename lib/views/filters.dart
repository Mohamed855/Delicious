import 'package:flutter/material.dart';

import '../values.dart';
import '../widgets/mainDrawer.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;

  Widget switchListTile({
    @required bool value,
    @required String title,
    @required String subtitle,
    @required Function onChanged,
  }) =>
      SwitchListTile(
        value: value,
        title: Text(
          title,
          style: TextStyle(
            color: value
                ? Theme.of(context).accentColor
                : Theme.of(context).shadowColor,
          ),
        ),
        subtitle: Text(subtitle),
        onChanged: onChanged,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Filters',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(lgSpace),
              child: Text(
                'Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  switchListTile(
                    value: _isVegan,
                    title: 'Vegan',
                    subtitle: 'only include Vegan meals',
                    onChanged: (value) => setState(() => _isVegan = value),
                  ),
                  switchListTile(
                    value: _isVegetarian,
                    title: 'Vegetarian',
                    subtitle: 'only include Vegetarian meals',
                    onChanged: (value) => setState(() => _isVegetarian = value),
                  ),
                  switchListTile(
                    value: _isGlutenFree,
                    title: 'Gluten Free',
                    subtitle: 'only include gluten free meals',
                    onChanged: (value) => setState(() => _isGlutenFree = value),
                  ),
                  switchListTile(
                    value: _isLactoseFree,
                    title: 'Lactose Free',
                    subtitle: 'only include Lactose free meals',
                    onChanged: (value) =>
                        setState(() => _isLactoseFree = value),
                  ),
                ],
              ),
            )
          ],
        ),
        drawer: MainDrawer(),
      );
}
