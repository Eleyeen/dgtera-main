class TableSQLiteModel {
  late final int? id;
  int? tableID;
  String? person;
  String? foodName;
  double? foodPrice;
  int? quantity;
  String? note;
  double? discount;
  String? size;
  double? totalPrice;

  TableSQLiteModel({
    required this.id,
    required this.tableID,
    required this.person,
    required this.foodName,
    required this.foodPrice,
    required this.quantity,
    required this.note,
    required this.discount,
    required this.size,
    required this.totalPrice,
  });

  TableSQLiteModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        tableID = res["tableID"],
        person = res["person"],
        foodName = res["foodName"],
        foodPrice = res["foodPrice"],
        quantity = res["quantity"],
        note = res["note"],
        discount = res["discount"],
        size = res["size"],
        totalPrice = res["totalPrice"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'tableID': tableID,
      'person': person,
      'foodName': foodName,
      'foodPrice': foodPrice,
      'quantity': quantity,
      'note': note,
      'discount': discount,
      'size': size,
      'totalPrice': totalPrice,
    };
  }
}
