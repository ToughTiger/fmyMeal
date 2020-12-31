
import 'package:MyMeal/screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);
  // navigationg through screens : Navigation in flutter with Navigator class
   void selectCategory(BuildContext ctx){
      Navigator.of(ctx).pushNamed(
        CategoryMealsScreen.routName, 
        arguments: {
          'id': id, 
          'title': title,
         },
        );
    }
  @override
  Widget build(BuildContext context) {
   
    return Container(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () => selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
          child: Container(
          padding: const EdgeInsets.all(15),   
          child: Text(
            title, 
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
            ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color ],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                
            ),
            borderRadius: BorderRadius.circular(15)
           ),
          
        ),
      ),
    );
  }
}