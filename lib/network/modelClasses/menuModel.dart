class MenuModel {
  String _messageType;
  String _mainMenu;
  String _alternateMenu;

  MenuModel({String messageType, String mainMenu, String alternateMenu}) {
    this._messageType = messageType;
    this._mainMenu = mainMenu;
    this._alternateMenu = alternateMenu;
  }

  String get messageType => _messageType;
  set messageType(String messageType) => _messageType = messageType;
  String get mainMenu => _mainMenu;
  set mainMenu(String mainMenu) => _mainMenu = mainMenu;
  String get alternateMenu => _alternateMenu;
  set alternateMenu(String alternateMenu) => _alternateMenu = alternateMenu;

  MenuModel.fromJson(Map<String, dynamic> json) {
    _messageType = json['messageType'];
    _mainMenu = json['mainMenu'];
    _alternateMenu = json['AlternateMenu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageType'] = this._messageType;
    data['mainMenu'] = this._mainMenu;
    data['AlternateMenu'] = this._alternateMenu;
    return data;
  }
}
