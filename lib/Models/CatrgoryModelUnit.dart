/// id : "1"
/// name : "pizza"
/// created_at : "2022-01-21 04:44:34"
/// updated_at : "2022-01-21\n04:44:34"

class CategoryModelUnit {
  CategoryModelUnit({
      String? id, 
      String? name, }){
    _id = id;
    _name = name;
}

  CategoryModelUnit.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['unit'];
  }
  String? _id;
  String? _name;

  String? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['unit'] = _name;
    return map;
  }

}