import 'package:flutter/material.dart';
import 'package:api_recipies_app/data_model.dart';

class Pagerecipes extends StatelessWidget{
  final Recipe recipes;
  const Pagerecipes({required this.recipes});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(recipes.name,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(recipes.image),
            Text("Name:${recipes.name}",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Cusines:${recipes.cuisine}",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text("Ingredients:${recipes.ingredients}",style: TextStyle(fontSize: 17,color: Colors.black),),
            SizedBox(height: 10,),
            Text("Instructions:${recipes.instructions}",style: TextStyle(fontSize: 17,color: Colors.black,),),
            SizedBox(height: 10,),
            Text("Cooktime:${recipes.cookTimeMinutes} minutes.",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
          ],
                    ),
        ),
      ),
    );
  }
}