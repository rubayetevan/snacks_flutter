import 'package:flutter/material.dart';
import 'package:snacks/Pages/home.dart';
import 'package:snacks/Pages/login.dart';

class Routes{
  void routeToHomepage(BuildContext context){
    Navigator.pushReplacement( context,  MaterialPageRoute( builder: (context) => Homepage()));
  }

  void routeToLoginPage(BuildContext context){
    Navigator.pushReplacement( context,  MaterialPageRoute( builder: (context) => LoginPage()));
  }

}

final routes = Routes();