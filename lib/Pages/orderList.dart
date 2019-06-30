import 'package:flutter/material.dart';
import 'package:snacks/blocs/bloc.dart';
import 'package:snacks/network/modelClasses/joblistModel.dart';
import 'package:toast/toast.dart';

class OrderListPage extends StatelessWidget {
  ScrollController _controller;
  int _page = 1;
  int _lastPage;
  bool _dataArrieved = false;

  @override
  Widget build(BuildContext context) {
    _controller = ScrollController()..addListener(_scrollListener);
    return Scaffold(
      body: Container(child: userList()),
    );
  }

  Widget userList() {
    bloc.showJoblist(_page);
    return StreamBuilder(
        stream: bloc.jobList,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            _dataArrieved = true;
            _lastPage = snapshot.data.common.totalpages;
            return ListView.builder(
              controller: _controller,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: (){},
                    child: ListTile(
                      title: Text(
                        snapshot.data.data[index].jobTitle,
                        style: TextStyle(fontSize: 25),
                      ),
                      subtitle: Text(snapshot.data.data[index].companyName),
                      trailing: Text('index: $index'),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data.data.length,
            );
          }
          else{
            return Center(
              child: Text("Loading"),
            );
          }
        });
  }

  void _scrollListener() {

    if (_controller.position.extentAfter < 500 && _page < _lastPage && _dataArrieved) {
      _page++;
      _dataArrieved = false;
      bloc.showJoblist(_page);
    }

  }
}
