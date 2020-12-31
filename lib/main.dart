import 'package:MyMeal/screens/categories_screen.dart';
import 'package:MyMeal/screens/meal_details_screen.dart';
import 'package:MyMeal/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';

void main(){
runApp(MyMeal());
} 

class MyMeal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.green,
        fontFamily: 'Roboto',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 60,
          fontWeight: FontWeight.bold,
          
          ),
          headline5: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(50, 153, 255,1)
          
          ),
      bodyText1: TextStyle(
        fontSize: 14, 
        fontFamily: 'Roboto',
        color: Color.fromRGBO(20, 51, 51, 1),
        ),
        

      )
      ),
      title: 'My Meal',
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreen(),
        CategoryMealsScreen.routName:(context) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen()
      },
      // onGenerateRoute: (setting){
      //   return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      // or
      // if(setting.name == 'meal-details'){
        // return MaterialPageRoute()
      // }else if(setting.name == 'xyg'){
        // return MaterialPageRoute()
      // }

      // },
      onUnknownRoute: (setting) {
       return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
      
      );
    
  }
}