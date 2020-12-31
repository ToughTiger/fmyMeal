import 'package:MyMeal/models/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailsScreen extends StatelessWidget {
 static const routeName = '/MealDetailsScreen';

 Widget sectionTitle(BuildContext ctx, title){
    return Text(
      title,
      style: Theme.of(ctx).textTheme.headline5,
    );
          
 }
  
  @override
  Widget build(BuildContext context) {
   final mealId = ModalRoute.of(context).settings.arguments as String;
   final mealDetails = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetails.title)
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                color: Colors.black,
                child: Image.network(mealDetails.imgUrl, 
                       fit: BoxFit.cover,
                       ),
                ),
              Container(
                margin: const EdgeInsets.fromLTRB(0,10,0,10),
                child: sectionTitle(context, 'Ingredients'),
                ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                  color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  ),
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                height: 150,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mealDetails.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                    // color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical:5.0, horizontal: 10),
                      child: Text(mealDetails.ingredients[index]),
                    ),
                    ),
                ),
                ),
              Container(
                 margin: EdgeInsets.symmetric(vertical: 10),
                child: sectionTitle(context, 'Steps'),
              ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                // scrollDirection: Axis.vertical,
                itemCount: mealDetails.steps.length,
                itemBuilder:(ctx, index) => Column(
                  children: [
                    ListTile(
                      onTap: (){},
                      leading:CircleAvatar(
                        child: Text('# ${(index+1)}',
                        ),
                        ),
                      title: Text('${mealDetails.steps[index]}'),
                        ),
                    Divider(),
                  ],
                
                ),
                  ),
              ),
                            
                ],
            
          ),
      ),
    );
    
      
  }
}