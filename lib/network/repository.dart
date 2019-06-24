import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'modelClasses/menuModel.dart';
import 'modelClasses/userModel.dart';

class Repository {
  static const String basURL = "http://172.16.9.235/snacks";
  static const int connectTimeout = 5000;
  static const int receiveTimeout = 3000;
  static const String contentType = "application/x-www-form-urlencoded";

  MenuModel _menuModel;
  UserModel _userModel;

  static final options = BaseOptions(
    baseUrl: basURL,
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
}

final repository = Repository();
