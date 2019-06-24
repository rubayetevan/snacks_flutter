import 'package:flutter/material.dart';
import 'package:snacks/blocs/bloc.dart';
import 'package:rounded_letter/rounded_letter.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.showUserInformation();
    bloc.showMenu();
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            verticalGap(20),
            Text(
              'Welcome',
              style: TextStyle(fontSize: 30),
            ),
            verticalGap(20),
            userThumb(),
            verticalGap(20),
            userName(),
            verticalGap(50),
            Text(
              'Today\'s Menu',
              style: TextStyle(fontSize: 30),
            ),
            verticalGap(20),
            mainMenu(),
            verticalGap(20),
            alternateMenu()
          ],
        ),
      ),
    ));
  }

  Widget userName() {
    return StreamBuilder(
        stream: bloc.userName,
        builder: (context, snapshot) {
          var name = "";
          if (snapshot.hasData) {
            name = snapshot.data;
          }
          return Text(
            name,
            style: TextStyle(fontSize: 30),
          );
        });
  }

  Widget verticalGap(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget userThumb() {
    return StreamBuilder(
        stream: bloc.userName,
        builder: (context, snapshot) {
          var name = "  ";
          if (snapshot.hasData) {
            name = snapshot.data;
          }
          return RoundedLetter.withRedCircle(name.substring(0, 1), 80, 40);
        });
  }

  Widget alternateMenu() {
    return StreamBuilder(
        stream: bloc.menu,
        builder: (context, snapshot) {
          var name = "Alternate menu: ";
          if (snapshot.hasData) {
            name = name + snapshot.data.alternateMenu;
          }
          return Text(
            name,
            style: TextStyle(fontSize: 20),
          );
        });
  }

  Widget mainMenu() {
    return StreamBuilder(
        stream: bloc.menu,
        builder: (context, snapshot) {
          var name = "Main menu: ";
          if (snapshot.hasData) {
            name = name + snapshot.data.mainMenu;
          }
          return Text(
            name,
            style: TextStyle(fontSize: 20),
          );
        });
  }
}
