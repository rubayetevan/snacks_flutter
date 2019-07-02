import 'package:flutter/material.dart';
import 'package:snacks/session/sessionManager.dart';
import 'package:snacks/utilities/permissionCheck.dart';
import './Pages/login.dart';
import 'Pages/home.dart';
import 'Pages/orderList.dart';
import 'blocs/bloc.dart';

void main() => runApp(SnacksApp());

class SnacksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.checkLoginStatus();
    return StreamBuilder(
        stream: bloc.isLoggedIn,
        builder: (context, snapshot) {
          var isLoggedIn = false;
          if (snapshot.hasData) {
            isLoggedIn = snapshot.data;
          }
          return MaterialApp(
            title: 'Snacks',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: isLoggedIn ? Homepage() : LoginPage(),
            //home: OrderListPage(),
          );
        });
  }
}
