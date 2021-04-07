import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cookbook/cuisine_provider.dart';
import 'package:cookbook/recipe_list.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'auth_screen_view.dart';
import 'cuisine_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textcontroller = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.reference();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  _signOut() async {
    await _firebaseAuth.signOut();
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.leftToRight,
        child: AuthScreenView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discover",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontFamily: "cursive",
                        ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.logout,
                            color: Colors.black,
                            size: 25,
                          ),
                          onPressed: () {
                            _signOut();
                          })
                    ],
                  ),
                  Text(
                    "Your daily inspiration of recipe",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontFamily: "cursive"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CuisineList()
                ],
              ),
            )));
  }
}

class CuisineList extends StatefulWidget {
  @override
  _CuisineListState createState() => _CuisineListState();
}

class _CuisineListState extends State<CuisineList> {
  List<CuisineElement> saved = [];
  @override
  Widget build(BuildContext context) {
    var cuisineVar = Provider.of<CuisineProvider>(context, listen: false);
    return Container(
      height: 400,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: cuisineVar.cuisineElement.length,
          itemBuilder: (context, index) {
            var items = cuisineVar.cuisineElement[index];

            return Stack(
              children: [
                Container(
                  width: 300,
                  height: 400,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child: RecipeListPage(
                                index: index,
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              "${cuisineVar.cuisineElement[index].image}",
                              fit: BoxFit.cover,
                            ))),
                  ),
                ),
                Positioned(
                    left: 16.0,
                    bottom: 30,
                    child: Text(
                      "${cuisineVar.cuisineElement[index].title}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: "cursive"),
                    )),
                Positioned(
                    right: 16.0,
                    bottom: 30,
                    child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.heart,
                          color: Colors.red,
                          size: 28,
                        ),
                        onPressed: () {
                          setState(() {
                            if (!saved.contains(items))
                              saved.add(items);
                            else
                              saved.remove(items);
                          });
                        })),
              ],
            );
          }),
    );
  }
}
