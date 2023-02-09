/// id : "1"
/// name : "pizza"
/// created_at : "2022-01-21 04:44:34"
/// updated_at : "2022-01-21\n04:44:34"

class ModelT {
  ModelT({
    String? name,
    String? itemNote,
    String? floorNNum,
    String? idIndex,
    String? itemDiscount,
    String? itemPrice,
    String? itemQty,
    String? itemSize,
    String? tableId,
    String? totalPrice,
  }) {
    _name = name;
    _itemNote = itemNote;
    _floorNum = floorNNum;
    // _idIndex = idIndex;
    _itemDiscount = itemDiscount;
    _itemPrice = itemPrice;
    _itemQty = itemQty;
    _itemSize = itemSize;
    _tableId = tableId;
    _totalPrice = totalPrice;
  }

  ModelT.fromJson(dynamic json) {
    _name = json['itemName'].toString();
    _itemNote = json['itemNote'].toString();
    _floorNum = json['floorNum'].toString();
    // _idIndex = json['idIndex'];
    _itemDiscount = json['itemDiscount'].toString();

    _itemPrice = json['itemPrice'].toString();
    _itemQty = json['itemQty'].toString();
    _itemSize = json['itemSize'].toString();
    // _tableId = json['tableId'].toString();
    _totalPrice = json['totalPrice'].toString();
    // _updatedAt = json['updated_at'];
  }
  String? _name;
  String? _itemNote;
  String? _totalPrice;
  String? _tableId;
  String? _itemSize;
  String? _itemQty;
  String? _itemPrice;
  String? _itemDiscount;
  String? _idIndex;
  String? _floorNum;

  String? get name => _name;
  String? get itemNote => _itemNote;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name.toString();
    map['itemNote'] = _itemNote.toString();
    map['floorNum'] = _floorNum.toString();
    // map['idIndex'] = _idIndex.toString();
    map['itemDiscount'] = _itemDiscount.toString();
    map['itemPrice'] = _itemPrice.toString();
    map['itemQty'] = _itemQty.toString();
    map['itemSize'] = _itemSize.toString();
    // map['tableId'] = _tableId.toString();
    map['totalPrice'] = _totalPrice.toString();
    // map['updated_at'] = _updatedAt;
    return map;
  }
}
