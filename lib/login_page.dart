import 'package:cookbook/global.dart';
import 'package:cookbook/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

import 'authentication_service.dart';
import 'bottom_navigation_bar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  String _email, _password;
  bool _isSubmitting;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  FirebaseAuth auth = FirebaseAuth.instance;
  final DateTime timestamp = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      
      body:
      Stack(
        alignment: Alignment.center,
        children: [
          Container(

              height: 750,
              width: 400,
              child: Image.network("https://images.pexels.com/photos/604969/pexels-photo-604969.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",fit: BoxFit.cover,)),


          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.8),

            ),
            alignment: Alignment.center,
            height: 300,
            width: 300,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _showTitle(),
                      _showEmailInput(),
                      _showPasswordInput(),
                      _showFormActions()
                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),

    );
  }

  _showTitle() {
    return Text("Login",style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold,fontStyle: FontStyle.normal),);
  }

  _showEmailInput() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        onSaved: (val) => _email = val,
        validator: (val) => !val.contains("@") ? "Invalid Email" : null,
        decoration: InputDecoration(
            // border: OutlineInputBorder(),
            labelText: "Email",
            hintText: "Enter Valid Email",
            icon: Icon(
              Icons.mail,
              color: Colors.grey,
              size: 18,
            )),
      ),
    );
  }

  _showPasswordInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: TextFormField(
        onSaved: (val) => _password = val,
        validator: (val) => val.length < 6 ? "Password Is Too Short" : null,
        obscureText: _obscureText,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child:
              Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
            ),
            // border: OutlineInputBorder(),
            labelText: "Password",
            hintText: "Enter Valid Password",
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
              size: 18,
            )),
      ),
    );
  }

  _showFormActions() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _isSubmitting == true
              ? CircularProgressIndicator(
            valueColor:
            AlwaysStoppedAnimation(Theme.of(context).primaryColor),
          )
              : RaisedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:38.0,vertical: 12),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              color: base_color,
              onPressed: _submit),
        ],
      ),
    );
  }

  _submit() {
    final _form = _formKey.currentState;
    if (_form.validate()) {
      _form.save();
      //print("Email $_email, Password $_password");
      _LoginUser();
    } else {
      print("Form is Invalid");
    }
  }

  _LoginUser() async {
    setState(() {
      _isSubmitting = true;
    });

    final logMessage = await context
        .read<AuthenticationService>()
        .signIn(email: _email, password: _password);

    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: BottomNavi(),
      ),
    );

    //print("I am logMessage $logMessage");

    if (logMessage == "Signed In") {
      return;
    } else {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  _showSuccessSnack(String message) async {
    final snackbar = SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        "$message",
        style: TextStyle(color: Colors.green),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
    _formKey.currentState.reset();
  }

  _showErrorSnack(String message) {
    final snackbar = SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        "$message",
        style: TextStyle(color: Colors.red),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackbar);
    setState(() {
      _isSubmitting = false;
    });
  }
}
