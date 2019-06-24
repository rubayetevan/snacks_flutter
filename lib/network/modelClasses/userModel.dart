class UserModel {
  List<Login> _login;

  UserModel({List<Login> login}) {
    this._login = login;
  }

  List<Login> get login => _login;
  set login(List<Login> login) => _login = login;

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['login'] != null) {
      _login = new List<Login>();
      json['login'].forEach((v) {
        _login.add(new Login.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._login != null) {
      data['login'] = this._login.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Login {
  String _userName;
  String _gid;
  String _email;
  String _messageType;

  Login({String userName, String gid, String email, String messageType}) {
    this._userName = userName;
    this._gid = gid;
    this._email = email;
    this._messageType = messageType;
  }

  String get userName => _userName;
  set userName(String userName) => _userName = userName;
  String get gid => _gid;
  set gid(String gid) => _gid = gid;
  String get email => _email;
  set email(String email) => _email = email;
  String get messageType => _messageType;
  set messageType(String messageType) => _messageType = messageType;

  Login.fromJson(Map<String, dynamic> json) {
    _userName = json['user_name'];
    _gid = json['gid'];
    _email = json['Email'];
    _messageType = json['messageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this._userName;
    data['gid'] = this._gid;
    data['Email'] = this._email;
    data['messageType'] = this._messageType;
    return data;
  }
}
