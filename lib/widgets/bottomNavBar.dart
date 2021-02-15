import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int _selectedPart;
  final Function _changeHomeContent;

  BottomNavBar(this._selectedPart, this._changeHomeContent);

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        backgroundColor: Theme.of(context).canvasColor,
        unselectedItemColor: Theme.of(context).shadowColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedFontSize: 14.0,
        selectedFontSize: 16.0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPart,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
                _selectedPart == 0 ? Icons.category : Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedPart == 1 ? Icons.star : Icons.star_border),
            label: 'Favorites',
          ),
        ],
        onTap: _changeHomeContent,
      );
}
