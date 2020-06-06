import 'package:flutter/material.dart';
import 'package:food_app/screen/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title,IconData icon,Function _taphandler){
    return ListTile(
      leading: Icon(icon,size: 26),
      title: Text(title,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 26,fontFamily: 'RobotoCondensed'),),
      onTap: _taphandler,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            height: 150,
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up!',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w700,fontFamily: 'RobotoCondensed',color: Theme.of(context).primaryColor),),
          ),
          SizedBox(height: 20,),
          buildListTile('Meals', Icons.fastfood,() {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filter', Icons.settings,() {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
