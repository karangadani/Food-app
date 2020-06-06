import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {

  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);
  @override
  Widget build(BuildContext context) {
    final routsargs = (ModalRoute.of(context).settings.arguments as Map<String,String>);
    final categoryTitle = routsargs['title'];
    final categoryId = routsargs['id'];
    final categoryMeal = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
      }).toList();
    return Scaffold(
      appBar: AppBar(
        title : Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx,index) {
        return MealItem(id: categoryMeal[index].id,title: categoryMeal[index].title, imageUrl: categoryMeal[index].imageUrl, duration: categoryMeal[index].duration, complexity: categoryMeal[index].complexity, affordabilty: categoryMeal[index].affordability);
      },itemCount: categoryMeal.length,)
    );
  }
}