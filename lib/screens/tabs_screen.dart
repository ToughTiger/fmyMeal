import 'package:MyMeal/screens/categories_screen.dart';
import 'package:MyMeal/screens/favorite_screen.dart';
import 'package:MyMeal/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
   { "page":CategoryScreen(), "title": "Meal Category" },
   { "page":FavoriteScreen(), "title": "Your Favorites"},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index){
    setState(() {
          _selectedPageIndex = index;
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
          centerTitle: true,
         
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap:_selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          items:[
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories')
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favorites')
            )
          ],
        ),
    );
  }
}