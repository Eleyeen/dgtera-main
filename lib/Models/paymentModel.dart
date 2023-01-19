class PaymentModel {
  PaymentModel({
    String? id,
    String? name,
    String? image,
    String? createdAt,
  }) {
    _name = name;
    _id = id;
    _image = image;

    _createdAt = createdAt;
  }

  PaymentModel.fromJson(dynamic json) {
    _name = json['name'];
    _image = json['image'];
    _id = json['id'];
    _createdAt = json['created_at'];
  }
  String? _name;
  String? _id;
  String? _image;
  String? _createdAt;

  String? get name => _name;

  String? get image => _image;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    return map;
  }
}
