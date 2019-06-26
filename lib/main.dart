import 'package:flutter/material.dart';
import 'package:snacks/session/sessionManager.dart';
import './Pages/login.dart';
import 'Pages/home.dart';
import 'Pages/orderList.dart';
import 'blocs/bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    sessionManager.isLoggedIn.then((value) {
      print("isLoggedin: $value");
      bloc.changeIsLoggedIn(value);
    });

    return StreamBuilder(
        stream: bloc.isLoggedIn,
        builder: (context, snapshot) {
          var isLoggedIn = false;
          if (snapshot.data != null && snapshot.data == true) {
            isLoggedIn = snapshot.data;
          }
          return MaterialApp(
            title: 'Snacks',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            //home: isLoggedIn ? Homepage() : LoginPage(),
            home: OrderListPage(),
          );
        });
  }
}
