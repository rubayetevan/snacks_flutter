import 'package:flutter/material.dart';
import 'package:snacks/blocs/bloc.dart';
import 'package:snacks/network/modelClasses/userListModel.dart';

class OtherOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Select person:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
                personDropDown()
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Select menu',
              style: TextStyle(fontSize: 20),
            ),
            radioButtons(),
            StreamBuilder(
                stream: bloc.orderDataValid,
                builder: (context, snapshot) {
                  return RaisedButton(
                    child: Text('Order'),
                    onPressed: snapshot.hasData ? () {} : null,
                  );
                })
          ],
        ),
      ),
    );
  }

  Widget radioButtons() {
    return StreamBuilder(
        stream: bloc.menu,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            var _alternateMenus = snapshot.data.alternateMenu.split("/");
            var _mainMenu = snapshot.data.mainMenu;
            return StreamBuilder(
                stream: bloc.orderRadioValue,
                builder: (context, snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Radio(
                            value: _mainMenu,
                            groupValue: snapshot.data,
                            onChanged: (value){
                              bloc.changeOrderRadioValue(value);
                            },
                          ),
                          Text(_mainMenu)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: _alternateMenus[0].trim(),
                            groupValue: snapshot.data,
                            onChanged: (value){
                              bloc.changeOrderRadioValue(value);
                            },
                          ),
                          Text(_alternateMenus[0].trim())
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: _alternateMenus[1].trim(),
                            groupValue: snapshot.data,
                            onChanged: (value){
                              bloc.changeOrderRadioValue(value);
                            },
                          ),
                          Text(_alternateMenus[1].trim())
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: _alternateMenus[2].trim(),
                            groupValue: snapshot.data,
                            onChanged: (value){
                              bloc.changeOrderRadioValue(value);
                            },
                          ),
                          Text(_alternateMenus[2].trim())
                        ],
                      ),
                    ],
                  );
                });
          } else {
            return Text('');
          }
        });
  }

  Widget personDropDown() {
    bloc.showUserList();

    return StreamBuilder(
        stream: bloc.userList,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            List<String> userList = List<String>();
            userList.clear();
            snapshot.data.users
                .forEach((element) => userList.add(element.uname));
            bloc.changeUserDropdownValue(userList[0]);
            return StreamBuilder(
                stream: bloc.userDropdownValue,
                builder: (context, snapshot) {
                  return DropdownButton<String>(
                    items: userList.map((String item) {
                      return DropdownMenuItem<String>(
                        child: Text(item),
                        value: item,
                      );
                    }).toList(),
                    onChanged: bloc.changeUserDropdownValue,
                    value: snapshot.hasData ? snapshot.data : userList[0],
                  );
                });
          } else {
            return Text('Loading');
          }
        });
  }
}
