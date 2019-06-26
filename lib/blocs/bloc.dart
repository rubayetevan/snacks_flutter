import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:snacks/network/modelClasses/joblistModel.dart';
import 'package:snacks/network/modelClasses/menuModel.dart';
import 'package:snacks/network/modelClasses/userListModel.dart';
import 'package:snacks/network/repository.dart';
import 'package:snacks/routing/routs.dart';
import 'package:snacks/session/sessionManager.dart';
import 'package:toast/toast.dart';
import './validators.dart';

class Bloc extends Validators {
  //-------------------BehaviorSubjects-----------------------------------------

  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _pageIndex = BehaviorSubject<int>();
  final _orderRadioValue = BehaviorSubject<String>();
  final _isLoggedIn = BehaviorSubject<bool>();
  final _userEmail = BehaviorSubject<String>();
  final _userName = BehaviorSubject<String>();
  final _Menu = BehaviorSubject<MenuModel>();
  final _userList = BehaviorSubject<UserListModel>();
  final _userDropdownValue = BehaviorSubject<String>();

  final _jobList = BehaviorSubject<JobListModel>();

  //-----------------------Stream-----------------------------------------------

  Stream<String> get userEmail =>
      _userEmail.stream.transform(validateUserEmail);

  Stream<String> get userName => _userName.stream.transform(validateUserName);

  Stream<String> get email => _email.stream.transform(validateEmail);

  Stream<String> get password => _password.stream.transform(validatePassword);

  Stream<bool> get loginDataValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  Stream<bool> get orderDataValid =>
      Observable.combineLatest2(userDropdownValue, orderRadioValue, (e, p) => true);

  Stream<int> get pageIndex => _pageIndex.stream.transform(validateIndex);

  Stream<bool> get isLoggedIn => _isLoggedIn.stream.transform(validateLogin);

  Stream<MenuModel> get menu => _Menu.stream.transform(validateMenu);

  Stream<UserListModel> get userList =>
      _userList.stream.transform(validateUsers);

  Stream<String> get orderRadioValue =>
      _orderRadioValue.stream.transform(validateOrder);

  Stream<String> get userDropdownValue =>
      _userDropdownValue.stream.transform(validateOrder);


  Stream<JobListModel> get jobList =>
      _jobList.stream.transform(validateJoblist);

  //-----------------------Function---------------------------------------------

  Function(String) get changeUserEmail => _userEmail.sink.add;

  Function(String) get changeUserName => _userName.sink.add;

  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(int) get changePageIndex => _pageIndex.sink.add;

  Function(String) get changeOrderRadioValue => _orderRadioValue.sink.add;

  Function(String) get changeUserDropdownValue => _userDropdownValue.sink.add;

  Function(bool) get changeIsLoggedIn => _isLoggedIn.sink.add;

  Function(MenuModel) get changeMenu => _Menu.sink.add;

  Function(UserListModel) get changeUserList => _userList.sink.add;

  Function(JobListModel) get changeJobList => _jobList.sink.add;


  //----------------------------dispose-----------------------------------------

  dispose() {
    _userEmail.close();
    _userName.close();
    _email.close();
    _password.close();
    _pageIndex.close();
    _isLoggedIn.close();
    _Menu.close();
    _orderRadioValue.close();
    _userList.close();
    _userDropdownValue.close();
    _jobList.close();
  }

  //---------------------------custom_functions---------------------------------

  submitLoginData(BuildContext context) {
    final email = _email.value;
    final password = _password.value;

    print('email: $email \n password: $password');

    repository.getLoginData(context, email, password).then((onValue) {
      if (onValue.login[0].messageType == '1') {
        sessionManager.createSession(onValue.login[0].userName,
            onValue.login[0].gid, onValue.login[0].email);
        routes.routeToHomepage(context);
      } else {
        Toast.show('Wrong username or password!', context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }
    });
  }

  void showUserInformation() {
    sessionManager.userName.then((onValue) {
      changeUserName(onValue);
    });
    sessionManager.email.then((onValue) {
      changeUserEmail(onValue);
    });
  }

  void showMenu() {
   /* repository.getMenu().then((onValue) {
      changeMenu(onValue);
    });*/
  }

  void logout(BuildContext context) {
   /* sessionManager.clearSession().whenComplete(() {
      routes.routeToLoginPage(context);
    });*/
  }

  void showUserList(){
   /* repository.getUserList().then((onValue){
      changeUserList(onValue);
      print(onValue);
    });*/

  }

  void showJoblist(int pageNumber){
    repository.getJobList(pageNumber).then((onValue){
      print('job found: ${onValue.common.totalRecordsFound}');
      changeJobList(onValue);
    });
  }
}

final bloc = Bloc();
