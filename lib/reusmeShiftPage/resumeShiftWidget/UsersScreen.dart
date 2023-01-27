import 'dart:convert';

import 'package:dgtera_tablet_app/Models/LoginPinModel.dart';
import 'package:dgtera_tablet_app/Models/ShowCustomerModel.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShift.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/addCostumer.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/addUser.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/customer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserScreen extends StatefulWidget {
  UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  void push() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Customer()));
  }

  customerUpdate(String id, String name, String role, String password) async {
    try {
      Response resposne = await post(
          Uri.parse('https://api.woga-pos.com/update_user.php'),
          body: {
            'id': id,
            'name': name,
            'role': role,
            'password': password,
          });

      var data = jsonDecode(resposne.body);
      if (data != null) {
        print('Customer Update Successfully');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Customer()));
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

  customerdelte(String id) async {
    try {
      Response resposne = await post(
          Uri.parse('https://api.woga-pos.com/delete_user.php'),
          body: {
            'id': id,
          });

      var data = jsonDecode(resposne.body);
      if (data != null) {
        print('Customer Update Successfully');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => UserScreen()));
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

  List<LoginPinModel> showCustomerList = [];

  var data;
  Future<List<LoginPinModel>> getUser() async {
    final response =
        await get(Uri.parse('https://api.woga-pos.com/selectuser.php'));
    data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      showCustomerList.clear();
      for (Map i in data) {
        showCustomerList.add(LoginPinModel.fromJson(i));
      }
      return showCustomerList;
    } else {
      return showCustomerList;
    }
  }

  List<dynamic> itemsAll = [];

  bool showListAll = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      itemsAll.addAll(showCustomerList);
    });
    super.initState();
    print(itemsAll);
  }

  List<dynamic> items = [];

  void filterSearchResults(String query) {
    List<dynamic> dummySearchList = [];
    dummySearchList.addAll(showCustomerList.map((e) => e.name.toString()));
    if (query.isNotEmpty) {
      List<dynamic> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(showCustomerList);
      });
    }
  }

  void filterSearchResultsAll(String query) {
    List<dynamic> dummySearchList = [];
    dummySearchList.addAll(showCustomerList.map((e) => e.name.toString()));
    if (query.isNotEmpty) {
      List<dynamic> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        itemsAll.clear();
        itemsAll.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        itemsAll.clear();
        itemsAll.addAll(showCustomerList);
      });
    }
  }

  Future<bool> _onWillPop(BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ResumeScreen()));

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              "Users",
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            // foregroundColor: Colors.black,
          ),
          body: Column(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[400],
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Icon(
                          Icons.home,
                          color: Colors.blue,
                        )),
                    // SizedBox(width: 8,),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      // width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: TextField(
                        onChanged: (value) {
                          filterSearchResultsAll(value);
                          setState(() {
                            print(itemsAll);
                            if (value.length > 0) {
                              showListAll = false;
                            } else {
                              showListAll = true;
                            }
                          });
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "Search ",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                        height: 40,
                        width: 60,
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => AddUsersScreen()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Center(
                            child: Text(
                              "Add User",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  "User Name",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top: 12),
                          child: Text(
                            "Role",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      // SizedBox(width: 2),
                      // Expanded(
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width,
                      //     height: 50,
                      //     decoration: BoxDecoration(color: Colors.grey),
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(left: 8, top: 12),
                      //       child: Text(
                      //         "Address",
                      //         style: TextStyle(
                      //             fontSize: 20,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.white),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      SizedBox(width: 2),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, top: 12),
                            child: Text(
                              "Action",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: showListAll
                          ? FutureBuilder(
                              future: getUser(),
                              builder: (context, snapshot) {
                                return ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return Divider();
                                    },
                                    itemCount: showCustomerList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () async {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          prefs.setString(
                                              'nameCus',
                                              showCustomerList[index]
                                                  .name
                                                  .toString());
                                          print(
                                              'clickkkkkkkkkkkkkkkkk${showCustomerList[index].name.toString()}');
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ResumeScreen()),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.person,
                                                      color: Colors.purple,
                                                      size: 25,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: Text(
                                                        showCustomerList[index]
                                                            .name
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, top: 12),
                                                child: Text(
                                                  showCustomerList[index]
                                                      .role
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            // SizedBox(width: 2),
                                            // Expanded(
                                            //   child: Container(
                                            //     width: MediaQuery.of(context)
                                            //         .size
                                            //         .width,
                                            //     height: 50,
                                            //     decoration: BoxDecoration(
                                            //         color: Colors.white),
                                            //     child: Padding(
                                            //       padding: const EdgeInsets.only(
                                            //           left: 8, top: 12),
                                            //       child: Text(
                                            //         showCustomerList[index]
                                            //             .address
                                            //             .toString(),
                                            //         style: TextStyle(
                                            //             fontSize: 20,
                                            //             color: Colors.black),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),

                                            SizedBox(width: 2),
                                            GestureDetector(
                                              onTap: () {
                                                print(
                                                    'customerIdddddddddddddddddddddddd${showCustomerList[index].id.toString()}');
                                                dialogBox(
                                                    showCustomerList[index]
                                                        .id
                                                        .toString(),
                                                    showCustomerList[index]
                                                        .name
                                                        .toString(),
                                                    showCustomerList[index]
                                                        .role
                                                        .toString(),
                                                    showCustomerList[index]
                                                        .password
                                                        .toString());
                                              },
                                              child: Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 15.0),
                                                  child: Container(
                                                    width: 80,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8,
                                                                top: 12),
                                                        child: Icon(
                                                          Icons.edit,
                                                          color: Colors.purple,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 2),
                                            GestureDetector(
                                              onTap: () {
                                                print(
                                                    'customerIdddddddddddddddddddddddd${showCustomerList[index].id.toString()}');
                                                dialogBoxDelete(
                                                    showCustomerList[index]
                                                        .id
                                                        .toString());
                                              },
                                              child: Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 100.0),
                                                  child: Container(
                                                    width: 80,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white),
                                                    child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8,
                                                                top: 12),
                                                        child: Icon(
                                                          Icons.delete,
                                                          color: Colors.red,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              })
                          : FutureBuilder(
                              future: getUser(),
                              builder: (context, snapshot) {
                                return ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return Divider();
                                    },
                                    itemCount: itemsAll.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          print('clickkkkkkkkkkkkkkkkk');
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ResumeScreen()),
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.person,
                                                      color: Colors.purple,
                                                      size: 25,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: Text(
                                                        itemsAll[index]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  5,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  color: Colors.white),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, top: 12),
                                                child: Text(
                                                  showCustomerList[index]
                                                      .role
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            // SizedBox(width: 2),
                                            // Expanded(
                                            //   child: Container(
                                            //     width: MediaQuery.of(context)
                                            //         .size
                                            //         .width,
                                            //     height: 50,
                                            //     decoration: BoxDecoration(
                                            //         color: Colors.white),
                                            //     child: Padding(
                                            //       padding: const EdgeInsets.only(
                                            //           left: 8, top: 12),
                                            //       child: Text(
                                            //         showCustomerList[index]
                                            //             .address
                                            //             .toString(),
                                            //         style: TextStyle(
                                            //             fontSize: 20,
                                            //             color: Colors.black),
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      );
                                    });
                              })),
                ],
              ),
            ),
          ])),
    );
  }

  void dialogBoxDelete(String? customerid) {
    showDialog(
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 200,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Are You Sure You Want to Delete",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      child: Text('No'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue[300],
                        onSurface: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserScreen()));
                      },
                    ),
                    TextButton(
                      child: Text('Yes'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue[300],
                        onSurface: Colors.grey,
                      ),
                      onPressed: () {
                        customerdelte(customerid.toString());
                        Future.delayed(
                          const Duration(seconds: 4),
                          () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserScreen()));
                          },
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
      context: context,
    );
  }

  String _userManager = "Manager";
  String get userManager => _userManager;

  void setUserManager(String userManager) {
    _userManager = userManager;
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Manager"), value: "Manager"),
      DropdownMenuItem(child: Text("Cashier"), value: "Cashier"),
    ];
    return menuItems;
  }

  void dialogBox(String? customerid, String? username, String? userRole,
      String? userPass) {
    showDialog(
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 450,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Are You Sure to update User",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, top: 12),
                            child: TextFormField(
                              // controller: _takePriceController,
                              onChanged: (value) {
                                setState(() {
                                  _nameController.text = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: username,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width,
                      //     height: 50,
                      //     decoration: BoxDecoration(color: Colors.white),
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(left: 8, top: 12),
                      //       child: TextFormField(
                      //         // controller: _takePriceController,
                      //         onChanged: (value) {
                      //           setState(() {
                      //             _phoneController.text = value;
                      //           });
                      //         },
                      //         decoration: InputDecoration(
                      //           hintText: userRole,
                      //           focusedBorder: UnderlineInputBorder(
                      //             borderSide: BorderSide(color: Colors.black),
                      //           ),
                      //         ),
                      //         style:
                      //             TextStyle(fontSize: 20, color: Colors.black),
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              iconEnabledColor: Colors.purple,
                              iconDisabledColor: Colors.black,
                              isExpanded: true,
                              value: userManager,
                              items: dropdownItems,
                              onChanged: (value) {
                                setState(() {
                                  setUserManager(value.toString());
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, top: 12),
                            child: TextFormField(
                              // controller: _takePriceController,
                              onChanged: (value) {
                                setState(() {
                                  _addressController.text = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: userPass,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  child: Text('Update'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue[300],
                    onSurface: Colors.grey,
                  ),
                  onPressed: () {
                    print('Pressed');
                    customerUpdate(
                        customerid.toString(),
                        _nameController.text.trim(),
                        userManager.toString(),
                        _addressController.text.trim());
                    Future.delayed(
                      const Duration(seconds: 4),
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserScreen()));
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
      context: context,
    );
  }
}
