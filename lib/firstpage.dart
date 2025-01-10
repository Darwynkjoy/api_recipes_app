import 'dart:convert';
import 'package:api_recipies_app/Recipes.dart';
import 'package:api_recipies_app/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Firstpage extends StatefulWidget{
  @override
  State<Firstpage> createState()=> _firstpageState();
}
class _firstpageState extends State<Firstpage>{
  bool _isloading=true;
  @override

  void initState(){
    super.initState();
    _getData();
  }

  Recipesmodelapi? dataFromAPI;

  _getData()async{
    try{
      String url="https://dummyjson.com/recipes";
      http.Response res=await http.get(Uri.parse(url));
      if(res.statusCode == 200){
        dataFromAPI=Recipesmodelapi.fromJson(json.decode(res.body));
        _isloading=false;
        setState(() { });
      }
    }
    catch (e){
      debugPrint(e.toString());
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Recipe App",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body:_isloading?
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      )
      :dataFromAPI == null?
      const Center(
        child: Text("Failed To Load Data"),
      )

      :GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 1,crossAxisSpacing: 1,childAspectRatio: 0.7),
      itemCount: dataFromAPI!.recipes.length,
      itemBuilder: (context,index){
        final Recipe=dataFromAPI!.recipes[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Pagerecipes(recipes: Recipe)));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8),
              height: 300,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
              border: Border.all(color: const Color.fromARGB(255, 0, 140, 255),
              width: 2),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 234, 245, 255),
                  blurRadius: 0,
                  spreadRadius: 1,
                )
              ]),
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 150,
                    width: 170,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(image: NetworkImage(Recipe.image),fit: BoxFit.cover)),
                    ),
                ),
                SizedBox(height: 10,),
                Text(Recipe.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                Text(Recipe.cuisine,style: TextStyle(fontSize: 20),),
              ],
              ),
            ),
          ),
        );
      })
    );
  }
}