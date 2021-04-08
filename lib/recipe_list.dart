

import 'package:cookbook/cuisine_provider.dart';
import 'package:cookbook/global.dart';
import 'package:cookbook/recipe_detail_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'auth_screen_view.dart';
class RecipeListPage extends StatefulWidget {
   final index;
   RecipeListPage({this.index});


  @override
  _RecipeListPageState createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {


  Widget recipe() {
    var recipeVar = Provider
        .of<CuisineProvider>(context, listen: false)
        .cuisineElement;
    return
      ListView.builder(
          itemCount: recipeVar[widget.index].foodRecipe.length,
          itemBuilder: (context, index) {
            return Stack(
               children: [

                Container(
                  height: 500,
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child:  Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: RecipeDetail(index: index,),
                                      ),
                                    );
                                  },
                                  child: Image.network("${recipeVar[widget.index].foodRecipe[index].img}",fit: BoxFit.cover,)))),
                    ),
                  ),
                ),
                 Positioned(
                     bottom: 30,
                     left: 30,
                     child: Text("${recipeVar[widget.index].foodRecipe[index].title}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'cursive'),)),
              ],
            );
          });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Scaffold(
          appBar: AppBar(
            backgroundColor: base_color,
            title:Text("Recipe",style: TextStyle(fontSize: 30,fontFamily: 'cursive',fontWeight: FontWeight.bold,color: Colors.white),),
          ),
            body:recipe()
          ),
        );

  }
}
