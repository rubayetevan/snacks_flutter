import 'package:flutter/material.dart';
import 'package:snacks/blocs/bloc.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Select menu',
            style: TextStyle(fontSize: 30),
          ),
          radioButtons(),
          StreamBuilder(
              stream: null,
              builder: (context, snapshot) {
                return RaisedButton(
                  child: Text('Order'),
                  onPressed: () {},
                );
              })
        ],
      ),
    ));
  }

  Widget radioButtons() {
    return StreamBuilder(
        stream: bloc.menu,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            var _alternateMenus = snapshot.data.alternateMenu.split("/");
            var _mainMenu = snapshot.data.mainMenu;
            return StreamBuilder(
                stream: bloc.radioIndex,
                builder: (context, snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 0,
                            groupValue: snapshot.data,
                            onChanged: bloc.changeRadioIndex,
                          ),
                          Text(_mainMenu)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: snapshot.data,
                            onChanged: bloc.changeRadioIndex,
                          ),
                          Text(_alternateMenus[0].trim())
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: snapshot.data,
                            onChanged: bloc.changeRadioIndex,
                          ),
                          Text(_alternateMenus[1].trim())
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 3,
                            groupValue: snapshot.data,
                            onChanged: bloc.changeRadioIndex,
                          ),
                          Text(_alternateMenus[2].trim())
                        ],
                      ),
                    ],
                  );
                });
          } else {
            return Text('Loading');
          }
        });
  }
}
