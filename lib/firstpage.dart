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
      appBar: AppBar(
        title: Text("Recipe App"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      body:_isloading?
      const Center(
        child: CircularProgressIndicator(),
      )
      :dataFromAPI == null?
      const Center(
        child: Text("Failed To Load Data"),
      )

      :GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 2,crossAxisSpacing: 2),
      itemCount: dataFromAPI!.recipes.length,
      itemBuilder: (context,index){
        final Recipe=dataFromAPI!.recipes[index];
        return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Pagerecipes(recipes: Recipe)));
          },
          child: Container(
            height: 300,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black,
            width: 2),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 196, 196, 196),
                blurRadius: 0,
                spreadRadius: 1,
              )
            ]),
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(Recipe.image,width: 100,height: 65,),
              SizedBox(height: 10,),
              Text(Recipe.name,style: TextStyle(fontSize: 10,),),

              Row(
                children: [
                  SizedBox(width: 30,),
                  Text(Recipe.cuisine),
                  SizedBox(width: 5,)
              ],
            )
            ],
            ),
          ),
        );
      })
    );
  }
}