
class Item {

 late final int? id;
  String? foodName;
  double? foodPrice;
  int? quantity;
  String? note;
  double? discount;
  String? size;
  double? totalPrice;

 Item({
  required this.id ,
  required this.foodName,
  required this.foodPrice,
  required this.quantity,
  required this.note,
  required this.discount,
  required this.size,
  required this.totalPrice,
 });

 Item.fromMap(Map<dynamic , dynamic>  res)
     : id = res['id'],
      foodName = res["foodName"],
      foodPrice = res["foodPrice"],
      quantity = res["quantity"],
      note = res["note"],
      discount = res["discount"],
      size = res["size"],
      totalPrice = res["totalPrice"];

 Map<String, Object?> toMap(){
  return {
   'id' : id ,
   'foodName' : foodName,
   'foodPrice' :foodPrice,
   'quantity' :quantity,
   'note' : note,
   'discount' : discount,
   'size' : size,
   'totalPrice' : totalPrice,
  };
 }
}