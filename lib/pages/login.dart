import 'dart:convert';

import 'package:dgtera_tablet_app/Models/LoginPinModel.dart';
import 'package:dgtera_tablet_app/Models/UserLogModel.dart';
import 'package:dgtera_tablet_app/Provider/UserLogProvider.dart';
import 'package:dgtera_tablet_app/dashbored/dashbored.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/modle/userModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

String? pinSelected = "";

class _LoginState extends State<Login> {
  TextEditingController textEditingController = new TextEditingController();

  LoginPinModel? _selectedUser;
  String _selectUserName = '';

  dialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            child: Container(
              height: 200,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Users",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  FutureBuilder(
                    future: getUser(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text(_selectUserName == ''
                            ? 'Loading'
                            : _selectUserName);
                      } else {
                        return DropdownButton<LoginPinModel>(
                          hint: Text(_selectUserName == ''
                              ? 'Choose User'
                              : _selectUserName), // Not necessary for Option 1
                          // value: _selectedUser.name,
                          onChanged: (LoginPinModel? newValue) {
                            setState(() {
                              _selectedUser = newValue;
                              setState(() {
                                _selectUserName = _selectedUser!.name!;
                              });
                              // _selectUserName = _selectUser
                              print(_selectedUser);
                              // Navigator.pop(context, true);
                            });
                          },
                          items: usersList.map((LoginPinModel data) {
                            return DropdownMenuItem<LoginPinModel>(
                              enabled: true,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(data.name.toString()),
                              ),
                              value: data,
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context, false);
                        });
                      },
                      child: Text(
                        "Ok",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      )),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  List<LoginPinModel> usersList = [];

  var data;
  Future<List<LoginPinModel>> getUser() async {
    final response =
        await get(Uri.parse('https://api.woga-pos.com/selectuser.php'));
    data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      usersList.clear();
      for (Map i in data) {
        usersList.add(LoginPinModel.fromJson(i));
      }
      return usersList;
    } else {
      return usersList;
    }
  }

  Future saveSPUserLog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'logintime', DateFormat.Hm().format(DateTime.now()).toString());
    prefs.setString('username', _selectedUser!.name.toString());

    // final response = await post(
    //     Uri.parse("https://api.woga-pos.com/insert_userslog.php"),
    //     body: {
    //       'username': _selectedUser!.name,
    //       // 'user_id': _selectedUser!.id,
    //       'date': DateFormat.yMMMd().format(DateTime.now()).toString(),
    //       'logintime': DateFormat.Hm().format(DateTime.now()).toString(),
    //       'logouttime': DateFormat.Hm().format(DateTime.now()).toString()
    //     });

    // if (response.statusCode == 200) {
    //   print(response.body);
    //   print("UserLog inserted successfully");
    // } else {
    //   print("UserLog not inserted");
    // }
  }

  login(String password, String name) async {
    try {
      Response resposne = await post(
          Uri.parse('https://api.woga-pos.com/userlogin.php'),
          body: {
            'password': password,
            'name': name,
            'username': name,
            'logintime': DateFormat.Hm().format(DateTime.now()).toString(),
          });

      var data = jsonDecode(resposne.body);
      if (data != null) {
        print('Login Successfully');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DashboredScreen()));
        return "ok";
      } else if (data == null) {
        print("Failed");
        return "failed";
      }
    } catch (e) {
      return "failed";
      print(e.toString());
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Text(_selectUserName == '' ? "Select User" : _selectUserName,
            style: TextStyle(
              color: Colors.grey.shade500,
            )),
        backgroundColor: Colors.white,
        // iconTheme: IconThemeData(color: Colors.black, opacity: 0.0),
        leading: Padding(
          padding: EdgeInsets.only(left: 16),
          child: CircleAvatar(
              radius: 70,
              // borderRadius: BorderRadius.circular(30),
              backgroundImage: AssetImage("assets/images/woga.jpg")),
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
              onPressed: () {
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
      body: SingleChildScrollView(
        child: Row(
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
                                          borderRadius:
                                              BorderRadius.circular(100)),
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
                                      onPressed: () async {
                                        print('pin : $pinSelected');
                                        print('Name :  ${_selectedUser!.name}');
                                        final res = await login(
                                            pinSelected.toString(),
                                            _selectedUser!.name!);
                                        if (res == "ok") {
                                          Provider.of<UserLogProvider>(context,
                                                  listen: false)
                                              .updatenameandpassword(
                                                  _selectedUser!.name!,
                                                  _selectedUser!.id!);
                                          Provider.of<UserLogProvider>(context,
                                                  listen: false)
                                              .changePassword(
                                                  _selectedUser!.id!,
                                                  pinSelected.toString());
                                          saveSPUserLog();
                                        } else {
                                          print("result not ok");
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content:
                                                Text("Plzz Check your Pin"),
                                          ));
                                        }
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)),
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
      ),
    );
  }

  String? pin;
  void pinIndexSetUp(String s) {
    setState(() {
      pinSelected = pinSelected! + s;
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
          obscuringCharacter: "*",
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
