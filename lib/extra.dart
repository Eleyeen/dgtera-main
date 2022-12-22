

import 'dart:convert';

import 'package:dgtera_tablet_app/Models/LoginPinModel.dart';
import 'package:dgtera_tablet_app/dashbored/dashbored.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/modle/userModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Login1 extends StatefulWidget {
  const Login1({Key? key}) : super(key: key);

  @override
  _Login1State createState() => _Login1State();
}
String? pinSelected="";
String username = "user";
String selectedusername = "emptyuser";
String selectepassword = "emptypassword";

class _Login1State extends State<Login1> {
  TextEditingController textEditingController = new TextEditingController();
  String _selectedGatagory = '';

   dialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState)
        {
         return Dialog(
            child: Container(
              height: 200,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Users", textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),),
                  FutureBuilder(
                    future: getUser(),
                    builder: (context , snapshot){
                      if(!snapshot.hasData){
                        return Text('Loading');
                      }else {

                              return DropdownButton(
                                hint: Text('Choose User'), // Not necessary for Option 1
                                // value: _selectedGatagory.toString(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedGatagory = newValue.toString();
                                    print(_selectedGatagory);
                                  });
                                },
                                items: usersList.map((data) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(data.name.toString()),
                                    ),
                                    value: data.name.toString(),
                                  );
                                }).toList(),
                              );

                      }
                    },
                  ),

                  TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedGatagory = _selectedGatagory;
                           Navigator.pop(context, false);
                        });
                      },
                      child: Text("Ok", textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),)),

                ],
              ),
            ),
          );
        });
      },

    );
  }

  List<LoginPinModel> usersList = [] ;

  var data;
  Future<List<LoginPinModel>> getUser() async {
    final response = await get(Uri.parse('https://api.woga-pos.com/selectuser.php')) ;
      data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      usersList.clear();
      for(Map i in data){
        usersList.add(LoginPinModel.fromJson(i));
      }
      return usersList ;
    }else {
      return usersList ;
    }
  }


   void login (String password, String name)async{

     print("Entered 1Password is $password");
     print("Entered 1name is $name");

    try{
      Response resposne = await post(Uri.parse('https://api.woga-pos.com/userlogin.php'),
          body: {
            'password': password,
            'name': name,
          }
      );

      var data = jsonDecode(resposne.body);
      if(data != null)
      {
        print("Entered Password is $password");
        print("Entered name is $name");
        print('Login Successfully');
            Navigator.push(context, MaterialPageRoute(builder: (context) => DashboredScreen()));
      }
      else if(data == null){
        print("Entered Password is $password");
        print("Entered name is $name");
        print("Failed");
        print(name);
        print(password);
      }
    }catch(e){

      print(e.toString());
    }
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
                                      print('pinnnnn $pinSelected');
                                      print('Nameeee $_selectedGatagory');
                                      login(pinSelected.toString(), _selectedGatagory);

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
          obscureText: false,
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
