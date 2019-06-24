import 'dart:async';
import 'package:snacks/session/preferencesHelper.dart';
import 'package:snacks/utilities/constants.dart';

class SessionManager {

  void createSession(String userName, String gid, String email) {
    setUserName(userName);
    setGid(gid);
    setEmail(email);
    setIsLoggedIn(true);
  }

   Future<String> get userName =>
      PreferencesHelper.getString(Constants.KEY_USERNAME);

   Future setUserName(String value) =>
      PreferencesHelper.setString(Constants.KEY_USERNAME, value);

   Future<String> get gid =>
      PreferencesHelper.getString(Constants.KEY_GID);

   Future setGid(String value) =>
      PreferencesHelper.setString(Constants.KEY_GID, value);

   Future<String> get email =>
      PreferencesHelper.getString(Constants.KEY_EMAIL);

   Future setEmail(String value) =>
      PreferencesHelper.setString(Constants.KEY_EMAIL, value);

   Future<bool> get isLoggedIn =>
      PreferencesHelper.getBool(Constants.KEY_ISLOGGEDIN);

   Future setIsLoggedIn(bool value) =>
      PreferencesHelper.setBool(Constants.KEY_ISLOGGEDIN, value);

   Future<void> clearSession() async {
    await Future.wait(<Future>[
      setIsLoggedIn(false),
      setGid(''),
      setEmail(''),
      setUserName('')
    ]);
  }
}
final sessionManager = SessionManager();
