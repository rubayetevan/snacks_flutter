import 'package:flutter/material.dart';
import './order.dart';
import './orderList.dart';
import './orderSummary.dart';
import './otherOrder.dart';
import '../blocs/bloc.dart';
import 'menu.dart';

class Homepage extends StatelessWidget {
  final List<Widget> _children = [
    MenuPage(),
    OrderPage(),
    OtherOrderPage(),
    OrderListPage(),
    OrderSummaryPage()
  ];

  @override
  Widget build(BuildContext context) {
    return bottomBar();
  }

  Widget bottomBar() {
    return StreamBuilder(
        stream: bloc.pageIndex,
        builder: (context, snapshot) {
          print("snapshot data = ${snapshot.data}");
          int _currentIndex = 0;
          if (snapshot.data != null) {
            _currentIndex = snapshot.data;
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('Snacks'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showAlert(context);
                  },
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: bloc.changePageIndex,
              currentIndex: _currentIndex,
              // this will be set when a new tab is tapped
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance),
                  title: Text('Menu'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('My Order'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.mail),
                  title: Text('Other\'s Order'),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), title: Text('Order List')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), title: Text('Summary')),
              ],
            ),
            body: _children[_currentIndex],
          );
        });
  }

  void showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Logout'),
            content: Text('Are you sure you want to logout from snacks app?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Yes'),
                onPressed: () {
                  bloc.logout(context);
                },
              ),
              FlatButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
