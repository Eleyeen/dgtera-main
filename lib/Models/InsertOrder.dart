/// id : "1"
/// order_id : "11"
/// customer : "kha\nn"
/// dates : "2222"
/// items : "food"
/// quantity : "2"
/// price : "4000"
/// discount : "10%"
/// voucher : "ww"
/// points : "ww"
/// notes : "wwd"
/// payments_method : "cc"
/// users_name : "adil"
/// times : "ssd"
/// pay_cash : "ddd"
/// pay_card : "no"
/// created_at : null
/// updated_at : null

class InsertOrder {
  InsertOrder({
      String? id, 
      String? orderId, 
      String? customer, 
      String? dates, 
      String? items, 
      String? quantity, 
      String? price, 
      String? discount, 
      String? voucher, 
      String? points, 
      String? notes, 
      String? paymentsMethod, 
      String? usersName, 
      String? times, 
      String? payCash, 
      String? payCard, 
      dynamic createdAt, 
      dynamic updatedAt,}){
    _id = id;
    _orderId = orderId;
    _customer = customer;
    _dates = dates;
    _items = items;
    _quantity = quantity;
    _price = price;
    _discount = discount;
    _voucher = voucher;
    _points = points;
    _notes = notes;
    _paymentsMethod = paymentsMethod;
    _usersName = usersName;
    _times = times;
    _payCash = payCash;
    _payCard = payCard;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  InsertOrder.fromJson(dynamic json) {
    _id = json['id'];
    _orderId = json['order_id'];
    _customer = json['customer'];
    _dates = json['dates'];
    _items = json['items'];
    _quantity = json['quantity'];
    _price = json['price'];
    _discount = json['discount'];
    _voucher = json['voucher'];
    _points = json['points'];
    _notes = json['notes'];
    _paymentsMethod = json['payments_method'];
    _usersName = json['users_name'];
    _times = json['times'];
    _payCash = json['pay_cash'];
    _payCard = json['pay_card'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  String? _id;
  String? _orderId;
  String? _customer;
  String? _dates;
  String? _items;
  String? _quantity;
  String? _price;
  String? _discount;
  String? _voucher;
  String? _points;
  String? _notes;
  String? _paymentsMethod;
  String? _usersName;
  String? _times;
  String? _payCash;
  String? _payCard;
  dynamic _createdAt;
  dynamic _updatedAt;
InsertOrder copyWith({  String? id,
  String? orderId,
  String? customer,
  String? dates,
  String? items,
  String? quantity,
  String? price,
  String? discount,
  String? voucher,
  String? points,
  String? notes,
  String? paymentsMethod,
  String? usersName,
  String? times,
  String? payCash,
  String? payCard,
  dynamic createdAt,
  dynamic updatedAt,
}) => InsertOrder(  id: id ?? _id,
  orderId: orderId ?? _orderId,
  customer: customer ?? _customer,
  dates: dates ?? _dates,
  items: items ?? _items,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
  discount: discount ?? _discount,
  voucher: voucher ?? _voucher,
  points: points ?? _points,
  notes: notes ?? _notes,
  paymentsMethod: paymentsMethod ?? _paymentsMethod,
  usersName: usersName ?? _usersName,
  times: times ?? _times,
  payCash: payCash ?? _payCash,
  payCard: payCard ?? _payCard,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  String? get id => _id;
  String? get orderId => _orderId;
  String? get customer => _customer;
  String? get dates => _dates;
  String? get items => _items;
  String? get quantity => _quantity;
  String? get price => _price;
  String? get discount => _discount;
  String? get voucher => _voucher;
  String? get points => _points;
  String? get notes => _notes;
  String? get paymentsMethod => _paymentsMethod;
  String? get usersName => _usersName;
  String? get times => _times;
  String? get payCash => _payCash;
  String? get payCard => _payCard;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['order_id'] = _orderId;
    map['customer'] = _customer;
    map['dates'] = _dates;
    map['items'] = _items;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['discount'] = _discount;
    map['voucher'] = _voucher;
    map['points'] = _points;
    map['notes'] = _notes;
    map['payments_method'] = _paymentsMethod;
    map['users_name'] = _usersName;
    map['times'] = _times;
    map['pay_cash'] = _payCash;
    map['pay_card'] = _payCard;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}