import 'package:cookbook/cuisine_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_screen_view.dart';
import 'authentication_service.dart';
import 'bottom_navigation_bar.dart';
import 'intro_Page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
providers: [
  ChangeNotifierProvider(create: (_) => CuisineProvider()),

  Provider<AuthenticationService>(
    create: (_) => AuthenticationService(FirebaseAuth.instance),
  ),
  StreamProvider(
      create: (context) =>
      context.read<AuthenticationService>().authStateChanges),
],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    if (firebaseUser != null) {
      //If the user is successfully Logged-In.
      return BottomNavi();
    } else {
      //If the user is not Logged-In.
      return AuthScreenView();
    }
  }
}