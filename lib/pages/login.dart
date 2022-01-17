
import 'dart:convert';

import 'package:dgtera_tablet_app/reusmeShiftPage/modle/userModel.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShift.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:dgtera_tablet_app/utilities/routes.dart';
import 'package:http/http.dart' as http;
import 'package:odoo/odoo.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
String? pinSelected="";
String username = "user";
String selectedusername = "emptyuser";
String selectepassword = "emptypassword";
                
class _LoginState extends State<Login> {
  TextEditingController textEditingController = new TextEditingController();
  List<String> catagory = [ 'User111', 'User222', 'User333', 'User444' , 'User555'];
  List<UserModel> usermodel = [];
  List<String> userpasswords =['1111','2222','3333','4444','5555'];
  String _selectedGatagory = 'User111';
  Map<String,dynamic> usercredentials ={"user1":"1111","user2":"2222","user3":"3333","user4":"4444","user5":"5555"};
  dialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 200,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Users", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                DropdownButton(
            hint: Text('Choose User'), // Not necessary for Option 1
            value: _selectedGatagory,
            onChanged: (newValue) {
              setState(() {
                _selectedGatagory = newValue.toString();
                username = newValue.toString();
                usermodel.forEach((element) {
                  if(username == element.username){
                    selectedusername = element.username;
                    selectepassword = element.password;
                  }
                });
              });
            },
            items: catagory.map((catagory) {
              return DropdownMenuItem(
                enabled: true,
                child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(catagory),
                ),
                value: catagory,
              );
            }).toList(),
          ),

                TextButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Text("Ok", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue),)),
               
              ],
            ),
          ),
        );
      },
      
    );
  }
 
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(username,
            style: TextStyle(
              color: Colors.grey.shade500,
            )),
        backgroundColor: Colors.white,
        // iconTheme: IconThemeData(color: Colors.black, opacity: 0.0),
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: CircleAvatar(
            // borderRadius: BorderRadius.circular(30),
              backgroundImage: AssetImage("assets/images/woga.jpg")
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 385),
            child: Center(
                child: Text(
                  "PIN CODE",
                  style: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 70),
            child: TextButton(
              onPressed: (){
                dialog();
              },
              child: Center(
                  child: Text(
                    "Change user",
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: [
                    PinScreen(),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 440,
                      width: 340,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PinButonLogin(
                                  num: "1",
                                  onPressed: () {
                                    pinIndexSetUp("1");
                                  }),
                              SizedBox(
                                width: 8,
                              ),
                              PinButonLogin(
                                  num: "2",
                                  onPressed: () {
                                    pinIndexSetUp("2");
                                  }),
                              SizedBox(
                                width: 8,
                              ),
                              PinButonLogin(
                                  num: "3",
                                  onPressed: () {
                                    pinIndexSetUp("3");
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PinButonLogin(
                                  num: "4",
                                  onPressed: () {
                                    pinIndexSetUp("4");
                                  }),
                              SizedBox(
                                width: 8,
                              ),
                              PinButonLogin(
                                  num: "5",
                                  onPressed: () {
                                    pinIndexSetUp("5");
                                  }),
                              SizedBox(
                                width: 8,
                              ),
                              PinButonLogin(
                                  num: "6",
                                  onPressed: () {
                                    pinIndexSetUp("6");
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PinButonLogin(
                                  num: "7",
                                  onPressed: () {
                                    pinIndexSetUp("7");
                                  }),
                              SizedBox(
                                width: 8,
                              ),
                              PinButonLogin(
                                  num: "8",
                                  onPressed: () {
                                    pinIndexSetUp("8");
                                  }),
                              SizedBox(
                                width: 8,
                              ),
                              PinButonLogin(
                                  num: "9",
                                  onPressed: () {
                                    pinIndexSetUp("9");
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade100,
                                  ),
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade400,
                                ),
                                height: 100,
                                width: 100,
                                child: MaterialButton(
                                    padding: EdgeInsets.all(8),
                                    onPressed: () {
                                      setState(() {
                                        pinSelected = "";
                                      });
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            100)),
                                    child: Center(
                                        child: Text(
                                          "Clear",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ))),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              PinButonLogin(
                                  num: "0",
                                  onPressed: () {
                                    pinIndexSetUp("0");
                                  }),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade100,
                                  ),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(70)),
                                  color: Colors.blue,
                                ),
                                height: 100,
                                width: 100,
                                child: MaterialButton(
                                    padding: EdgeInsets.all(8),
                                    onPressed: () {
                                      print(selectepassword);
                                      if(pinSelected ==selectepassword){
                                      Navigator.pushNamed(
                                          context, MyRoutes.dashboredRoute);
                                        }
                                      else{
                                      print("invalid pin");

                                      }
                                      },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            100)),
                                    child: Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  void initState()
  {
    int i=0;
    //oddooconnect();
    //add data to list
    catagory.forEach((element) {
       usermodel.add(UserModel(username: element,password: userpasswords[i]));
       i+=1;      
    });

      usermodel.forEach((element) {
        print(element.username);
        print(element.password);
        
      });

    super.initState();
  }

  oddooconnect()async{
    final odoo = await Odoo(Connection(url: Url(Protocol.http, "https://sitpos.odoo.com/", 8080), db: 'jarlicious-stagging2-3450394'));
    print("oddoconnecting");

  UserLoggedIn user = await odoo.connect(Credential("admin", "sit@123"));
  print(user.name);
  }
  oddoInsert()async{
    // String tableName = "dptera";
    //
    // Map<String,dynamic> args = {"login":"tester", "name":"tester"};
    // await odoo.insert(tableName, args);
  }
  @override
  void dispose() {
   // odoo.disconnect();
    super.dispose();
  }
    String? pin ;
  void pinIndexSetUp(String s) {

    setState(() {
      pinSelected =  pinSelected! + s;
    });
    print(pinSelected);
  }
  setPin(String text) {}

}

class PinScreen extends StatelessWidget {
   PinScreen({
    Key? key,
  }) : super(key: key);

  TextEditingController pinController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    // int pinIndex = 0;
    // String currentPin = "";
    pinController.text = pinSelected!;
    return Container(
      width: 340,
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Center(
        child: TextField(
          controller: pinController,
          enabled: false,
          obscureText: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              border: InputBorder.none, filled: true, fillColor: Colors.white),
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}

class PinButonLogin extends StatelessWidget {
  final String num;
  final Function() onPressed;
  const PinButonLogin({
    Key? key,
    required this.num,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
          shape: BoxShape.circle
          // color: Colors.white,
          ),
      height: 100,
      width: 100,
      child: MaterialButton(
        padding: EdgeInsets.all(8),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Center(
            child: Text(
          "$num",
          style: TextStyle(fontSize: 40, color: Colors.grey.shade500),
        )),
      ),
    );
  }
}
