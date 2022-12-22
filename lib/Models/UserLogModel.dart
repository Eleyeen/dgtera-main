/// id : "1"
/// username : "zayan"
/// date : "2/2/2022"
/// logintime : "9:00"
/// logouttime : "10:00"

class UserLogModel {
  UserLogModel({
      String? id, 
      String? username, 
      String? date, 
      String? logintime, 
      String? logouttime,}){
    _id = id;
    _username = username;
    _date = date;
    _logintime = logintime;
    _logouttime = logouttime;
}

  UserLogModel.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _date = json['date'];
    _logintime = json['logintime'];
    _logouttime = json['logouttime'];
  }
  String? _id;
  String? _username;
  String? _date;
  String? _logintime;
  String? _logouttime;

  String? get id => _id;
  String? get username => _username;
  String? get date => _date;
  String? get logintime => _logintime;
  String? get logouttime => _logouttime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['date'] = _date;
    map['logintime'] = _logintime;
    map['logouttime'] = _logouttime;
    return map;
  }

}