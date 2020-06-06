import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/Favorites-Screen';
  final List<Meal> favoritesMeal;
  FavoritesScreen(this.favoritesMeal);
  @override
  Widget build(BuildContext context) {
     if(favoritesMeal.isEmpty){
      return(
        Center(
          child: Text("No Favorites Added yet!"),
        )
      );
    }else{
      return ListView.builder(itemBuilder: (ctx,index) {
        return MealItem(id: favoritesMeal[index].id,title: favoritesMeal[index].title, imageUrl: favoritesMeal[index].imageUrl, duration: favoritesMeal[index].duration, complexity: favoritesMeal[index].complexity, affordabilty: favoritesMeal[index].affordability);
      },itemCount: favoritesMeal.length);
    }
  }
}