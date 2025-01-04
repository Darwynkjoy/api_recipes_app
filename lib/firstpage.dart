import 'dart:convert';

import 'package:api_recipies_app/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Firstpage extends StatefulWidget{
  @override
  State<Firstpage> createState()=> _firstpageState();
}
class _firstpageState extends State<Firstpage>{
  bool? _isloading=true;
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
        return Container(
          height: 300,
          width: 300,
        );
      })
    );
  }
}