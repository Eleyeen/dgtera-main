/// id : "1"
/// name : "ali"
/// email : "ali@gmail.com"
/// email_verified_at : null
/// password : "123456"
/// remember_token : null
/// created_at : "2022-02-02\n13:20:27"
/// updated_at : "2022-02-20\n13:20:34"

class LoginPinModel {
  LoginPinModel({
      String? id,
      String? name, 
      String? email, 
      dynamic emailVerifiedAt, 
      String? password, 
      dynamic rememberToken, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id as String;
    _name = name;
    _email = email;
    _emailVerifiedAt = emailVerifiedAt;
    _password = password;
    _rememberToken = rememberToken;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  LoginPinModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _emailVerifiedAt = json['email_verified_at'];
    _password = json['password'];
    _rememberToken = json['remember_token'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _name;
  String? _email;
  dynamic _emailVerifiedAt;
  String? _password;
  dynamic _rememberToken;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get password => _password;
  dynamic get rememberToken => _rememberToken;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['email_verified_at'] = _emailVerifiedAt;
    map['password'] = _password;
    map['remember_token'] = _rememberToken;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}