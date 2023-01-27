import 'dart:convert';

import 'package:dgtera_tablet_app/Models/ShowCustomerModel.dart';
import 'package:dgtera_tablet_app/extra.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShift.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/addCostumer.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/customerTable.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Customer extends StatefulWidget {
  Customer({Key? key}) : super(key: key);

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  List<ShowCustomerModel> showCustomerList = [];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  void push() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Customer()));
  }

  customerUpdate(String id, String name, String phone, String address) async {
    try {
      Response resposne = await post(
          Uri.parse('https://api.woga-pos.com/update_customer.php'),
          body: {
            'id': id,
            'name': name,
            'phone': phone,
            'address': address,
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
          Uri.parse('https://api.woga-pos.com/delete_customer.php'),
          body: {
            'id': id,
          });

      var data = jsonDecode(resposne.body);
      if (data != null) {
        print('Customer Update Successfully');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResumeScreen()));
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

  Future<List<ShowCustomerModel>> showCustomer() async {
    final response =
        await get(Uri.parse("https://api.woga-pos.com/show_customers.php"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      showCustomerList.clear();
      for (Map i in data) {
        showCustomerList.add(ShowCustomerModel.fromJson(i));
      }
      return showCustomerList;
    }
    return showCustomerList;
  }
  // String? name = '';

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
              "Customers",
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
                                  builder: (builder) => AddCostomer()));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Center(
                            child: Text(
                              "Add Customer",
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
                                  "Customer Name",
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
                            "Phone",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 2),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, top: 12),
                            child: Text(
                              "Address",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
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
                              future: showCustomer(),
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
                                                      .phone
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 2),
                                            Expanded(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, top: 12),
                                                  child: Text(
                                                    showCustomerList[index]
                                                        .address
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ),
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
                                                        .phone
                                                        .toString(),
                                                    showCustomerList[index]
                                                        .address
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
                              future: showCustomer(),
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
                                                    Product()),
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
                                                      .phone
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 2),
                                            Expanded(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    color: Colors.white),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, top: 12),
                                                  child: Text(
                                                    showCustomerList[index]
                                                        .address
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ),
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
                                builder: (context) => Customer()));
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
                                    builder: (context) => Customer()));
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

  void dialogBox(String? customerid, String? customername,
      String? customerphone, String? customeraddress) {
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
                  "Are You Sure to update Customer",
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
                                hintText: customername,
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
                                  _phoneController.text = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: customerphone,
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
                                hintText: customeraddress,
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
                        _phoneController.text.trim(),
                        _addressController.text.trim());
                    Future.delayed(
                      const Duration(seconds: 4),
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Customer()));
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
