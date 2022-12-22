/// name : "potato"
/// arbic_name : "albatatis"
/// stock_in_hand : "34"
/// category_id : "1"
/// barcode : "3"
/// dineprice : "444"
/// takeawayprice : "44"
/// vat : "4%"
/// unitofmeasure : "5555"
/// image : "https://api.woga-pos.com/Images/dummyimage.jpg"
/// description : "ddd"
/// created_at : "2022-01-21\n04:53:10"
/// updated_at : "2022-01-21\n04:53:21"

class InsertProductModel {
  InsertProductModel({
      String? name, 
      String? arbicName, 
      String? stockInHand, 
      String? categoryId, 
      String? barcode, 
      String? dineprice, 
      String? takeawayprice, 
      String? vat, 
      String? unitofmeasure, 
      String? image, 
      String? description,}){
    _name = name;
    _arbicName = arbicName;
    _stockInHand = stockInHand;
    _categoryId = categoryId;
    _barcode = barcode;
    _dineprice = dineprice;
    _takeawayprice = takeawayprice;
    _vat = vat;
    _unitofmeasure = unitofmeasure;
    _image = image;
    _description = description;

}

  InsertProductModel.fromJson(dynamic json) {
    _name = json['name'];
    _arbicName = json['arbic_name'];
    _stockInHand = json['stock_in_hand'];
    _categoryId = json['category_id'];
    _barcode = json['barcode'];
    _dineprice = json['dineprice'];
    _takeawayprice = json['takeawayprice'];
    _vat = json['vat'];
    _unitofmeasure = json['unitofmeasure'];
    _image = json['image'];
    _description = json['description'];

  }
  String? _name;
  String? _arbicName;
  String? _stockInHand;
  String? _categoryId;
  String? _barcode;
  String? _dineprice;
  String? _takeawayprice;
  String? _vat;
  String? _unitofmeasure;
  String? _image;
  String? _description;


  String? get name => _name;
  String? get arbicName => _arbicName;
  String? get stockInHand => _stockInHand;
  String? get categoryId => _categoryId;
  String? get barcode => _barcode;
  String? get dineprice => _dineprice;
  String? get takeawayprice => _takeawayprice;
  String? get vat => _vat;
  String? get unitofmeasure => _unitofmeasure;
  String? get image => _image;
  String? get description => _description;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['arbic_name'] = _arbicName;
    map['stock_in_hand'] = _stockInHand;
    map['category_id'] = _categoryId;
    map['barcode'] = _barcode;
    map['dineprice'] = _dineprice;
    map['takeawayprice'] = _takeawayprice;
    map['vat'] = _vat;
    map['unitofmeasure'] = _unitofmeasure;
    map['image'] = _image;
    map['description'] = _description;

    return map;
  }

}