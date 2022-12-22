/// id : "1"
/// name : "khan"
/// phone : "03339690704"
/// address : "buner"
/// created_at : "2022-01-21\n04:43:56"
/// updated_at : "2022-01-21\n04:44:09"

class ShowCustomerModel {
  ShowCustomerModel({
      String? id, 
      String? name, 
      String? phone, 
      String? address, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _name = name;
    _phone = phone;
    _address = address;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  ShowCustomerModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _phone = json['phone'];
    _address = json['address'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _name;
  String? _phone;
  String? _address;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get name => _name;
  String? get phone => _phone;
  String? get address => _address;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['phone'] = _phone;
    map['address'] = _address;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}