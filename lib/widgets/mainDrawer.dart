import 'package:flutter/material.dart';

import '../values.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget drawerListTile(BuildContext context,
          {@required Icon icon, @required Text text, Function onTap}) =>
      Padding(
        padding: EdgeInsets.only(top: space),
        child: ListTile(
          leading: icon,
          title: text,
          onTap: onTap,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            alignment: Alignment.centerLeft,
            height: 150.0,
            width: double.infinity,
            padding: EdgeInsets.all(lgSpace),
            child: Text(
              'Delicious',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          drawerListTile(
            context,
            icon: Icon(
              Icons.restaurant,
              color: currentPage == '/'
                  ? Theme.of(context).accentColor
                  : Theme.of(context).shadowColor,
            ),
            text: Text(
              'Meals',
              style: currentPage == '/'
                  ? Theme.of(context).textTheme.headline5
                  : Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
              setState(() => currentPage = '/');
            },
          ),
          drawerListTile(
            context,
            icon: Icon(
              Icons.settings,
              color: currentPage == '/filters'
                  ? Theme.of(context).accentColor
                  : Theme.of(context).shadowColor,
            ),
            text: Text(
              'Filters',
              style: currentPage == '/filters'
                  ? Theme.of(context).textTheme.headline5
                  : Theme.of(context).textTheme.headline6,
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/filters');
              setState(() => currentPage = '/filters');
            },
          ),
        ],
      ),
    );
  }
}
