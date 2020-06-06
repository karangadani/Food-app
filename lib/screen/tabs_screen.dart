import 'package:flutter/material.dart';
import 'package:food_app/screen/category_screen.dart';
import 'package:food_app/screen/favorites_screen.dart';
import 'package:food_app/widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritesMeal;

  TabsScreen(this.favoritesMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
  List<Widget> _pages;

  int _selectedPageindex = 0;
  void _onselectTab(int index){
    setState(() {
      _selectedPageindex = index;
    });
  }

  @override
  void initState() {
    _pages= [
    CategoryScreen(),
    FavoritesScreen(widget.favoritesMeal),
  ];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPageindex == 0 ? 'Category' : 'Favroites'),
      ),
      drawer: MainDrawer(),

      body: _pages[_selectedPageindex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _onselectTab,
        selectedItemColor: Theme.of(context).accentColor,
        elevation: 4,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageindex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favroites'),
          ),
        ],
      ),
    );
  }
}
