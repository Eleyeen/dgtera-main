import 'package:dgtera_tablet_app/Models/LoginPinModel.dart';
import 'package:flutter/cupertino.dart';

class UserLogProvider extends ChangeNotifier {

   String name = "";
   String id = "";
   String password = "";


  void updatenameandpassword(String name,String id){
    this.name=name;
    this.id=id;
    notifyListeners();
  }

  void changePassword(String id, String password){
    this.id=id;
    this.password=password;
    notifyListeners();
  }




}