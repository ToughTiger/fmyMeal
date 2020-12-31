import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  Widget buildMenu(BuildContext context,String title, IconData icon) {
    return ListTile(
      onTap: (){},
      leading: Icon(icon),
      title: Text(title, style: Theme.of(context).textTheme.headline5,),
      );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
        Container(
          // alignment: Alignment.centerLeft,
          height: 80,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(vertical: 50),
          color: Colors.white,
          child: Text(
            'My Meal', 
             style: TextStyle(
               fontSize: 25,
               fontWeight: FontWeight.w700,
               color: Theme.of(context).primaryColor,
             ),
             textAlign: TextAlign.center,
             ),
        ),
        SizedBox(height: 20,),
        buildMenu(context, 'MEAL',Icons.restaurant),
        SizedBox(height: 20,),
         buildMenu(context, 'Filter',Icons.settings),
        
      ],),
    );
  }
}