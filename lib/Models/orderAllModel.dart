class OrderAllModel {
  OrderAllModel({
    String? id,
    String? order_id,
    String? customer,
    String? dates,
    String? items,
    String? quantity,
    String? discount,
    String? price,
    String? voucher,
    String? points,
    String? payments_method,
    String? users_name,
    String? times,
    String? pay_cash,
    String? pay_card,
    String? created_at,
    String? updated_at,
  }) {
    _id = id;
    _order_id = order_id;
    _customer = customer;
    _dates = dates;
    _items = items;
    _quantity = quantity;
    _discount = discount;
    _price = price;
    _voucher = voucher;
    _points = points;
    _payments_method = payments_method;
    _users_name = users_name;
    _times = times;
    _pay_cash = pay_cash;
    _pay_card = pay_card;
    _created_at = created_at;
    _updated_at = updated_at;
  }

  OrderAllModel.fromJson(dynamic json) {
    _id = json['id'];
    _order_id = json['order_id'];
    _customer = json['customer'];
    _dates = json['dates'];
    _items = json['items'];
    _quantity = json['quantity'];
    _discount = json['discount'];
    _price = json['price'];
    _voucher = json['voucher'];
    _points = json['points'];
    _payments_method = json['payments_method'];
    _users_name = json['users_name'];
    _times = json['times'];
    _pay_cash = json['pay_cash'];
    _pay_card = json['pay_card'];
    _created_at = json['created_at'];
    _updated_at = json['updated_at'];
  }

  String? _id;
  String? _order_id;
  String? _customer;
  String? _dates;
  String? _items;
  String? _quantity;
  String? _discount;
  String? _price;
  String? _voucher;
  String? _points;
  String? _payments_method;
  String? _users_name;
  String? _times;
  String? _pay_cash;
  String? _pay_card;
  String? _created_at;
  String? _updated_at;

  String? get id => _id;
  String? get order_id => _order_id;
  String? get customer => _customer;
  String? get dates => _dates;
  String? get items => _items;
  String? get quantity => _quantity;
  String? get discount => _discount;
  String? get price => _price;
  String? get voucher => _voucher;
  String? get points => _points;
  String? get payments_method => _payments_method;
  String? get users_name => _users_name;
  String? get times => _times;
  String? get pay_cash => _pay_cash;
  String? get pay_card => _pay_card;
  String? get created_at => _created_at;
  String? get updated_at => _updated_at;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _id;
    map['arbic_name'] = _order_id;
    map['stock_in_hand'] = _customer;
    map['category_id'] = _dates;
    map['barcode'] = _items;
    map['dineprice'] = _quantity;
    map['takeawayprice'] = _discount;
    map['vat'] = _price;
    map['unitofmeasure'] = _voucher;
    map['image'] = _points;
    map['description'] = _payments_method;
    map['created_at'] = _users_name;
    map['updated_at'] = _times;
    map['updated_at'] = _pay_cash;
    map['updated_at'] = _pay_card;
    map['updated_at'] = _created_at;
    map['updated_at'] = _updated_at;
    return map;
  }
}
