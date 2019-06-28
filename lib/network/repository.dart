import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snacks/network/modelClasses/joblistModel.dart';
import 'modelClasses/menuModel.dart';
import 'modelClasses/userListModel.dart';
import 'modelClasses/userModel.dart';

class Repository {
  static const String basURL = "http://172.16.9.235/snacks";
  static const String basURLJobs = "https://jobs.bdjobs.com/apps/api/v1";
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 3000;
  static const String contentType = "application/x-www-form-urlencoded";

  MenuModel _menuModel;
  UserModel _userModel;
  UserListModel _userListModel;

  JobListModel _jobListModel;

  static final options = BaseOptions(
    baseUrl: basURLJobs,
    //baseUrl: basURL,
    connectTimeout: connectTimeout,
    receiveTimeout: receiveTimeout,
    contentType: ContentType.parse(contentType),
    headers: {HttpHeaders.contentTypeHeader: contentType},
  );

  final _dio = Dio(options);
  final _getOptions = Options(method: "GET");
  final _postOptions = Options(method: "POST");

  Future<MenuModel> getMenu() async {
    if (_menuModel == null) {
      var response = await _dio.request(
        "/getmenu.asp",
        //data: {"id":12,"name":"xx"},
        options: _getOptions,
      );
      print(response.data);
      _menuModel = MenuModel.fromJson(response.data);
      return _menuModel;
    } else {
      return _menuModel;
    }
  }

  Future<UserListModel> getUserList() async {
    if (_userListModel == null) {
      var response = await _dio.request(
        "/getuserlist.asp",
        options: _getOptions,
      );
      print(response.data);
      _userListModel = UserListModel.fromJson(response.data);
      return _userListModel;
    } else {
      return _userListModel;
    }
  }

  Future<UserModel> getLoginData(
    BuildContext context,
    String username,
    String password,
  ) async {
    if (_userModel == null) {
      var response = await _dio.request(
        "/SnacksLogin.asp",
        data: {"un": username, "up": password},
        options: _postOptions,
      );
      print(response.data);
      _userModel = UserModel.fromJson(response.data);
      return _userModel;
    } else {
      return _userModel;
    }
  }

  Future<JobListModel> getJobList(int pageNumber) async {
    print('pagenumber repo: $pageNumber');
    var response = await _dio.request(
      "/joblist.asp",
      queryParameters: {
        "armyp": "1",
        "encoded": "02041526JSBJ2",
        "pg": pageNumber,
        "appId": "1"
      },
      options: _getOptions,
    );

    if (pageNumber == 1) {
      _jobListModel = JobListModel.fromJson(response.data);
    } else {
      JobListModel.fromJson(response.data)
          .data
          .forEach((element) => _jobListModel.data.add(element));
      _jobListModel.common.totalpages =
          JobListModel.fromJson(response.data).common.totalpages;
    }

    print('pagenumber data size:${_jobListModel.data.length}');
    return _jobListModel;
  }
}

final repository = Repository();
