import 'package:dgtera_tablet_app/Provider/UserLogProvider.dart';
import 'package:dgtera_tablet_app/pages/login.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShift.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePinCode extends StatelessWidget {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _oldPass = TextEditingController();

  changePassword(String userId, String password) async {
    final response = await http.post(
        Uri.parse(
          "https://api.woga-pos.com/update_userpass.php",
        ),
        body: {
          'id': userId,
          'password': password,
        });

    if (response.statusCode == 200) {
      print(response.body);

      print("User Password changed successfully");
    } else {
      print("User Password not Changed");
    }
  }

  @override
  Widget build(BuildContext context) {
    var userPassword = Provider.of<UserLogProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Password",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          // foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 50,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 90,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage("assets/images/woga.jpg"),
                      fit: BoxFit.fill,
                      scale: 1,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height -50,
                  child: Form(
                      key: _form,
                      child: Column(mainAxisSize: MainAxisSize.min,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _oldPass,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                    ),
                                    labelStyle: TextStyle(color: Colors.blue),
                                    hintStyle: TextStyle(
                                        color: Colors.blue, fontSize: 15),
                                    // icon: Icon(Icons.mail),
                                    prefixIcon:
                                        Icon(Icons.lock, color: Colors.blue),
                                    hintText: '********',
                                    labelText: 'Old Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                    )),
                                validator: (val) {
                                  if (val!.isEmpty) return 'Empty';
                                  return null;
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _pass,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                    ),
                                    labelStyle: TextStyle(color: Colors.blue),
                                    hintStyle: TextStyle(
                                        color: Colors.blue, fontSize: 15),
                                    // icon: Icon(Icons.mail),
                                    prefixIcon:
                                        Icon(Icons.lock, color: Colors.blue),
                                    hintText: '********',
                                    labelText: 'New Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                    )),
                                validator: (val) {
                                  if (val!.isEmpty) return 'Empty';
                                  return null;
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _confirmPass,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                    ),
                                    labelStyle: TextStyle(color: Colors.blue),
                                    hintStyle: TextStyle(
                                        color: Colors.blue, fontSize: 15),
                                    // icon: Icon(Icons.mail),
                                    prefixIcon:
                                        Icon(Icons.lock, color: Colors.blue),
                                    hintText: '********',
                                    labelText: 'confirm Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(32),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2),
                                    )),
                                validator: (val) {
                                  if (val!.isEmpty) return 'Empty';
                                  if (val != _pass.text) return 'Not Match';
                                  return null;
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 90,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              child: ElevatedButton(
                                // padding: EdgeInsets.symmetric(
                                //     vertical: 5, horizontal: 100),
                                // shape: StadiumBorder(),
                                onPressed: () async {
                                  // _formSubmit();
                                  print('change pass clickkkkk');
                                  final prefs =
                                      await SharedPreferences.getInstance();

                                  final String? userId =
                                      prefs.getString('userId');

                                  final String? oldpass =
                                      prefs.getString('oldpassword');

                                  print(
                                      'change pass clickkkkk${userId.toString()}');
                                  if (oldpass ==
                                      _oldPass.text.trim().toString()) {
                                    if (_pass.text.trim().toString() ==
                                        _confirmPass.text.trim().toString()) {
                                      final res = await changePassword(
                                          userId.toString(),
                                          _confirmPass.text.trim().toString());
                                      if (res == "ok") {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text("Password Not Changed "),
                                        ));
                                      } else {
                                        print("result not ok");
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text(
                                              "Your Password is Changed Successfully"),
                                        ));
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            "Your new password and confirm password is not same"),
                                      ));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "Your Old Password  is not correct"),
                                    ));
                                  }
                                },
                                child: Text(
                                  'Reset Password',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                // color: Colors.blue,
                              ),
                            ),
                            SizedBox(
                              height: 200,
                            )
                          ])),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
