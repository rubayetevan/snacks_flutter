import 'package:flutter/material.dart';
import 'package:snacks/blocs/bloc.dart';
import 'package:snacks/network/modelClasses/joblistModel.dart';

class OrderListPage extends StatelessWidget {
  ScrollController controller;
  int page = 1;
  int lastpage;
  bool loadMore = false;
  bool dataArrieved = false;

  @override
  Widget build(BuildContext context) {
    controller = ScrollController()..addListener(_scrollListener);
    return Scaffold(
      body: Container(child: userList()),
    );
  }

  Widget userList() {
    bloc.showJoblist(page);
    return StreamBuilder(
        stream: bloc.jobList,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            dataArrieved = true;
            lastpage = snapshot.data.common.totalpages;
            return ListView.builder(
              controller: controller,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data.data[index].jobTitle,
                    style: TextStyle(fontSize: 25),
                  ),
                  subtitle: Text(snapshot.data.data[index].companyName),
                  trailing: Text('index: $index'),
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
    int tempPage = page;
    print('controller: ${controller.position}');
    if (controller.position.extentAfter < 500 && page <= lastpage && dataArrieved) {
      page++;
      loadMore = true;
    }

    if (page > lastpage) {
      loadMore = false;
    }

    if (loadMore && page != tempPage && dataArrieved) {
      print('pagenumber: $page dataArrieved: $dataArrieved');
      dataArrieved = false;
      bloc.showJoblist(page);
    }
  }
}
