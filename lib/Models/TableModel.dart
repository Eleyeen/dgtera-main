/// id : "3"
/// shape : "Rectangular"
/// floor : "2"
/// people : "10"
/// color : "Black"
/// created_at : "2022-03-04\n16:18:00"
/// updated_at : "2022-03-04\n16:18:00"

class TableModel {
  TableModel({
      String? id, 
      String? shape, 
      String? floor, 
      String? people, 
      String? color, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _shape = shape;
    _floor = floor;
    _people = people;
    _color = color;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  TableModel.fromJson(dynamic json) {
    _id = json['id'];
    _shape = json['shape'];
    _floor = json['floor'];
    _people = json['people'];
    _color = json['color'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _shape;
  String? _floor;
  String? _people;
  String? _color;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get shape => _shape;
  String? get floor => _floor;
  String? get people => _people;
  String? get color => _color;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['shape'] = _shape;
    map['floor'] = _floor;
    map['people'] = _people;
    map['color'] = _color;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}