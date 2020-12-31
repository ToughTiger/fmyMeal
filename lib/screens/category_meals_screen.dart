import 'package:MyMeal/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routName = '/categoryM-meals';
  
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) => meal.categories.contains(categoryId)).toList();
    return Scaffold(
          appBar: AppBar(
            title: Text(categoryTitle)
          ),
          body: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (context, index){
              return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title, 
                imgUrl: categoryMeals[index].imgUrl,
                steps: categoryMeals[index].steps,
                duration: categoryMeals[index].duration,
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity
                );

            })
      );
  
  }
}