

import 'dart:async';

import 'package:cookbook/global.dart';
import 'package:cookbook/my-App.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter/material.dart';

import 'login_page.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {

// Here you can write your code

      Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: AuthenticationWrapper(),
        ),
      );

    });
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: base_color,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child:
          Image.asset("assets/food.png",
            height: 200,
          ),

          ),
          // ClipPath(
          //   clipper: OvalBottomBorderClipper(),
          //   child: Container(
          //     height: 500,
          //     color: base_color,
          //     child: Center(child:
          //     Image.asset("assets/food.png",
          //     height: 200,
          //     ),
          //
          //     ),
          //   ),
          // ),
          //  Padding(
          //    padding: const EdgeInsets.all(20.0),
          //    child: Row(
          //     children: [
          //       Flexible(
          //         child: Text("Let's Get\nStarted",textAlign: TextAlign.start,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
          //       )
          //     ],
          // ),
          //  )

        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // Add your onPressed code here!
      //   },
      //   label: Padding(
      //     padding: const EdgeInsets.all(80.0),
      //     child: const Text('Get Started',style: TextStyle(fontSize: 20,color: Colors.black),),
      //   ),
      //   // icon: const Icon(Icons.thumb_up),
      //   backgroundColor: base_color,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    ),


    );
  }
}
