import 'package:flutter/cupertino.dart';

class DineInProvider with ChangeNotifier {

  double? _cash ;
  double? get cash => _cash ;

  double? _credit ;
  double? get credit => _credit;

  double? _split ;
  double? get split => _split;

  double? _splitInPersons ;
  double? get splitInPersons => _splitInPersons;

  double? _voucher ;
  double? get voucher => _voucher;

  String? _notes ;
  String? get notes => _notes;

  String? _paymentMethod ;
  String? get paymentMethod => _paymentMethod;

  double? _discount ;
  double? get discount => _discount;

  double? _finalDiscount ;
  double? get finalDiscount => _finalDiscount;

  void setCash(double cash){
    this._cash = cash;
  }

  void setCredit(double credit){
    this._credit = credit;
  }

  void setSplit(double split){
    this._split = split;
  }

  void setSplitInPersons(double splitInPersons){
    this._splitInPersons = splitInPersons;
  }

  void setVoucher(double voucher){
    this._voucher = voucher;
  }

  void setNotes(String notes){
    this._notes = notes;
  }

  void setPaymentMethod(String paymentMethod){
    this._paymentMethod = paymentMethod;
  }

  void setDiscount(double discount){
    this._discount = discount;
  }

  void setfinalDiscount(double finalDiscount){
    this._finalDiscount = finalDiscount;
  }

  notifyListeners();
}