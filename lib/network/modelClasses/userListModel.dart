class UserListModel {
  List<Users> users;

  UserListModel({this.users});

  UserListModel.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = new List<Users>();
      json['users'].forEach((v) {
        users.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String uname;
  String gid;
  String messageType;

  Users({this.uname, this.gid, this.messageType});

  Users.fromJson(Map<String, dynamic> json) {
    uname = json['uname'];
    gid = json['gid'];
    messageType = json['messageType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uname'] = this.uname;
    data['gid'] = this.gid;
    data['messageType'] = this.messageType;
    return data;
  }
}
