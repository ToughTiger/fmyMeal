import 'package:MyMeal/models/meal.dart';
import 'package:MyMeal/screens/meal_details_screen.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String imgUrl;
  final String title;
  final List<String> steps;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  MealItem({
    @required this.id,
    @required this.title,
    @required this.imgUrl,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability
    }

  );


  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown';
    }
  }
  
  void selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(
      MealDetailsScreen.routeName,
      arguments: id,
    );

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>selectMeal(context),
      child: Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), 
                topRight:Radius.circular(15) 
              ),
              child: Image.network(
              imgUrl, 
              height: 250, 
              width: double.infinity, 
              fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 10,
                right: 5,
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                  title, 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24, 
                    // fontWeight: FontWeight.bold
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,

                    ),
                ),
            )
          ]

          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget> [
                Row(
                  children: [
                  Icon(Icons.timer,),
                  SizedBox(width: 6),
                  Text(
                   '$duration min', 
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      ),
                  ),
                  
                  ]
                 
                ),
                 Row(
                  children: [
                  Icon(Icons.work,),
                  SizedBox(width: 6),
                  Text(
                   complexityText, 
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      ),
                  ),
                  
                  ]
                 
                ),
                 Row(
                  children: [
                  Icon(Icons.attach_money,),
                  SizedBox(width: 6),
                  Text(
                   affordabilityText, 
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      ),
                  ),
                  
                  ]
                 
                ),

                //   Row(
               
              ]
            ),
          ),
         
        ]
      ),
      ),
    );
  }
}