import 'package:flutter/material.dart';
import 'package:food_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter';

  final Function saveFilter;
  final Map<String,bool> currentFilter;

  FilterScreen(this.currentFilter,this.saveFilter);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  bool _guletenFree = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;
  bool _vegan = false;

  @override
  initState(){
    _guletenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegan = widget.currentFilter['vegan'];
    _vegetarian = widget.currentFilter['vegetarian'];
    super.initState();
  }



  Widget _buildSwitchListTile(String title,String description,bool currentValue,Function updateValue){
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.save), onPressed: () {
            final selectedFilter = {
          'gluten' : _guletenFree,
          'lactose' : _lactoseFree,
          'vegan' : _vegan,
          'vegetarian' : _vegetarian,
          };
            return widget.saveFilter(selectedFilter);}),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.center,
            child: Text(
              'Adjust Your Meal Selection',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          _buildSwitchListTile('Gluten-Free', 'Only include gluten-free meals', _guletenFree, (newValue) {
            setState(() {
              _guletenFree = newValue;
            });
          }),
          _buildSwitchListTile('Lactose-Free', 'Only include Lactose-free meals', _lactoseFree, (newValue) {
            setState(() {
              _lactoseFree = newValue;
            });
          }),
          _buildSwitchListTile('Vegetarian', 'Only include gluten-free meals', _vegetarian, (newValue) {
            setState(() {
              _vegetarian = newValue;
            });
          }),
          _buildSwitchListTile('Vegan', 'Only include Vegan meals', _vegan, (newValue) {
            setState(() {
              _vegan = newValue;
            });
          }),
        ],
      ),
    );
  }
}
