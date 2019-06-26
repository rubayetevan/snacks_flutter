class JobListModel {
  String _statuscode;
  String _message;
  List<Data> _data;
  Common _common;

  JobListModel(
      {String statuscode, String message, List<Data> data, Common common}) {
    this._statuscode = statuscode;
    this._message = message;
    this._data = data;
    this._common = common;
  }

  String get statuscode => _statuscode;
  set statuscode(String statuscode) => _statuscode = statuscode;
  String get message => _message;
  set message(String message) => _message = message;
  List<Data> get data => _data;
  set data(List<Data> data) => _data = data;
  Common get common => _common;
  set common(Common common) => _common = common;

  JobListModel.fromJson(Map<String, dynamic> json) {
    _statuscode = json['statuscode'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
    _common =
    json['common'] != null ? new Common.fromJson(json['common']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statuscode'] = this._statuscode;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    if (this._common != null) {
      data['common'] = this._common.toJson();
    }
    return data;
  }
}

class Data {
  String _jobid;
  String _jobTitle;
  String _companyName;
  String _deadline;
  String _deadlineDB;
  String _publishDate;
  String _eduRec;
  String _experience;
  String _standout;
  String _logo;
  String _lantype;

  Data(
      {String jobid,
        String jobTitle,
        String companyName,
        String deadline,
        String deadlineDB,
        String publishDate,
        String eduRec,
        String experience,
        String standout,
        String logo,
        String lantype}) {
    this._jobid = jobid;
    this._jobTitle = jobTitle;
    this._companyName = companyName;
    this._deadline = deadline;
    this._deadlineDB = deadlineDB;
    this._publishDate = publishDate;
    this._eduRec = eduRec;
    this._experience = experience;
    this._standout = standout;
    this._logo = logo;
    this._lantype = lantype;
  }

  String get jobid => _jobid;
  set jobid(String jobid) => _jobid = jobid;
  String get jobTitle => _jobTitle;
  set jobTitle(String jobTitle) => _jobTitle = jobTitle;
  String get companyName => _companyName;
  set companyName(String companyName) => _companyName = companyName;
  String get deadline => _deadline;
  set deadline(String deadline) => _deadline = deadline;
  String get deadlineDB => _deadlineDB;
  set deadlineDB(String deadlineDB) => _deadlineDB = deadlineDB;
  String get publishDate => _publishDate;
  set publishDate(String publishDate) => _publishDate = publishDate;
  String get eduRec => _eduRec;
  set eduRec(String eduRec) => _eduRec = eduRec;
  String get experience => _experience;
  set experience(String experience) => _experience = experience;
  String get standout => _standout;
  set standout(String standout) => _standout = standout;
  String get logo => _logo;
  set logo(String logo) => _logo = logo;
  String get lantype => _lantype;
  set lantype(String lantype) => _lantype = lantype;

  Data.fromJson(Map<String, dynamic> json) {
    _jobid = json['jobid'];
    _jobTitle = json['jobTitle'];
    _companyName = json['companyName'];
    _deadline = json['deadline'];
    _deadlineDB = json['deadlineDB'];
    _publishDate = json['publishDate'];
    _eduRec = json['eduRec'];
    _experience = json['experience'];
    _standout = json['standout'];
    _logo = json['logo'];
    _lantype = json['lantype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobid'] = this._jobid;
    data['jobTitle'] = this._jobTitle;
    data['companyName'] = this._companyName;
    data['deadline'] = this._deadline;
    data['deadlineDB'] = this._deadlineDB;
    data['publishDate'] = this._publishDate;
    data['eduRec'] = this._eduRec;
    data['experience'] = this._experience;
    data['standout'] = this._standout;
    data['logo'] = this._logo;
    data['lantype'] = this._lantype;
    return data;
  }
}

class Common {
  int _totalRecordsFound;
  String _showad;
  int _totalpages;

  Common({int totalRecordsFound, String showad, int totalpages}) {
    this._totalRecordsFound = totalRecordsFound;
    this._showad = showad;
    this._totalpages = totalpages;
  }

  int get totalRecordsFound => _totalRecordsFound;
  set totalRecordsFound(int totalRecordsFound) =>
      _totalRecordsFound = totalRecordsFound;
  String get showad => _showad;
  set showad(String showad) => _showad = showad;
  int get totalpages => _totalpages;
  set totalpages(int totalpages) => _totalpages = totalpages;

  Common.fromJson(Map<String, dynamic> json) {
    _totalRecordsFound = json['total_records_found'];
    _showad = json['showad'];
    _totalpages = json['totalpages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_records_found'] = this._totalRecordsFound;
    data['showad'] = this._showad;
    data['totalpages'] = this._totalpages;
    return data;
  }
}
