import 'dart:async';

import 'package:snacks/network/modelClasses/menuModel.dart';
import 'package:snacks/network/modelClasses/userListModel.dart';

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError('Enter a valid mail');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else {
      sink.addError('Enter a valid password');
    }
  });

  final validateIndex =
      StreamTransformer<int, int>.fromHandlers(handleData: (pageIndex, sink) {
    if (pageIndex != null) {
      sink.add(pageIndex);
    } else {
      sink.add(0);
    }
  });

  final validateOrder =
  StreamTransformer<String, String>.fromHandlers(handleData: (order, sink) {
    if (order != null) {
      sink.add(order);
    } else {
      sink.add("");
    }
  });

  final validateLogin = StreamTransformer<bool, bool>.fromHandlers(
      handleData: (isLoggedIn, sink) {
    sink.add(isLoggedIn);
  });

  final validateUserName = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username != null) {
      sink.add(username);
    } else {
      sink.addError('username not found');
    }
  });

  final validateUserEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (useremail, sink) {
    if (useremail != null) {
      sink.add(useremail);
    } else {
      sink.addError('useremail not found');
    }
  });
  final validateMenu =
      StreamTransformer<MenuModel, MenuModel>.fromHandlers(handleData: (menu, sink) {
    if (menu != null) {
      sink.add(menu);
    } else {
      sink.addError('menu not found');
    }
  });
  final validateUsers =
  StreamTransformer<UserListModel, UserListModel>.fromHandlers(handleData: (userList, sink) {
    if (userList != null) {
      sink.add(userList);
    } else {
      sink.addError('userList not found');
    }
  });
}
