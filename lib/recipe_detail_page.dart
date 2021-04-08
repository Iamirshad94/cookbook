import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cookbook/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cuisine_provider.dart';

class RecipeDetail extends StatefulWidget {
 final index;
 RecipeDetail({this.index});
  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  
  Widget _body(){
    var recipeVar = Provider
        .of<CuisineProvider>(context, listen: false)
        .cuisineElement;
    return ListView(
      children: [
      Container(
          height: 300,
          child: ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
              child: Image.network("${recipeVar[widget.index].foodRecipe[widget.index].img}",fit: BoxFit.cover,))),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
           height: 1000,
           child: Column(
             children: [
               Text("${recipeVar[widget.index].foodRecipe[widget.index].title}",style: TextStyle(color: Colors.black,fontFamily: 'cursive',fontWeight: FontWeight.bold,fontSize: 30),),
               SizedBox(
                 height: 30,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [

                   Column(
                     children: [
                       Icon(Icons.alarm,color: base_color,),
                       SizedBox(
                         height: 5,
                       ),
                       Text("${recipeVar[widget.index].foodRecipe[widget.index].time}",style: TextStyle(color: Colors.black,fontFamily: 'cursive',fontWeight: FontWeight.normal,fontSize: 16),),
                     ],
                   ),
                   Column(
                     children: [
                       Icon(Icons.comment_outlined,color: base_color,),
                       SizedBox(
                         height: 5,
                       ),
                       Text("5",style: TextStyle(color: Colors.black,fontFamily: 'cursive',fontWeight: FontWeight.normal,fontSize: 16),),
                     ],
                   ),

                   Column(
                     children: [
                       Icon(FontAwesomeIcons.heart,color: base_color,),
                       SizedBox(
                         height: 5,
                       ),
                       Text("5",style: TextStyle(color: Colors.black,fontFamily: 'cursive',fontWeight: FontWeight.normal,fontSize: 16),),
                     ],
                   ),
                 ],
               ),
               SizedBox(
                 height: 30,
               ),
               Flexible(child: Text("${recipeVar[widget.index].foodRecipe[widget.index].detail}",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'cursive'),))
            ,
               SizedBox(
                 height: 30,
               ),
               Flexible(child: Text("Ingredients",style: TextStyle(color: Colors.black,fontSize: 32,fontFamily: 'cursive',fontWeight: FontWeight.bold),))
            ,
               SizedBox(
                 height: 10,
               ),
               Flexible(child: Text("${recipeVar[widget.index].foodRecipe[widget.index].ingre}",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'cursive',fontWeight: FontWeight.normal),))
            ,
               SizedBox(
                 height: 20,
               ),
               Flexible(child: Text("Directions",style: TextStyle(color: Colors.black,fontSize: 32,fontFamily: 'cursive',fontWeight: FontWeight.bold),)),
               SizedBox(
                 height: 10,
               ),
               Flexible(child: Text("${recipeVar[widget.index].foodRecipe[widget.index].directions}",style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'cursive',fontWeight: FontWeight.normal),)),

             ],
           ),
         ),
       ),

      ],
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    var recipeVar = Provider
        .of<CuisineProvider>(context, listen: false)
        .cuisineElement;
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: _body(),
    ));
  }
}
