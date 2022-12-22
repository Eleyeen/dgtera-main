import 'package:dgtera_tablet_app/DB_Helper/db_helper.dart';
import 'package:dgtera_tablet_app/Models/TaxModel.dart';
import 'package:flutter/cupertino.dart';

class TaxProvider with ChangeNotifier {

  double? _tax ;
  double? get tax => _tax ;

  double? _totalTax ;
  double? get totalTax => _totalTax;

  void setData(double tax){
    this._tax = tax;
  }

  void setTax(double totalAmount){
    this._totalTax = totalAmount;
  }

  notifyListeners();
}