import 'package:flutter/material.dart';
import 'package:api_recipies_app/data_model.dart';

class Pagerecipes extends StatelessWidget{
  final Recipe recipes;
  const Pagerecipes({required this.recipes});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 245, 255),
      appBar: AppBar(
        title: Text(recipes.name,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 320,
                width: 320,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 3,color: const Color.fromARGB(255, 0, 140, 255)),
                image: DecorationImage(image: NetworkImage(recipes.image))),
                ),
            ),
            Text("Name:${recipes.name}",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
            Text("Cusines:${recipes.cuisine}",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ingredients",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),
                Text("${recipes.ingredients}",style: TextStyle(fontSize: 17,color: Colors.black),),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Instructions:",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),
                Text("${recipes.instructions}",style: TextStyle(fontSize: 17,color: Colors.black,),),
              ],
            ),
            Text("Cooktime: ${recipes.cookTimeMinutes} minutes.",style: TextStyle(fontSize: 21,color: Colors.black,fontWeight: FontWeight.bold),),
          ],
                    ),
        ),
      ),
    );
  }
}