import 'dart:convert';

import 'package:dgtera_tablet_app/Models/ShowCustomerModel.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/addCostumer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Customer extends StatefulWidget {
  Customer({Key? key}) : super(key: key);

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  List<ShowCustomerModel> showCustomerList = [];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            "Add Coustomer",
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
                                    return Row(
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
                                            padding: const EdgeInsets.all(8.0),
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
                                                        color: Colors.black),
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
                                              padding: const EdgeInsets.only(
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
                                    return Row(
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
                                            padding: const EdgeInsets.all(8.0),
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
                                                    itemsAll[index].toString(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black),
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
                                              padding: const EdgeInsets.only(
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
                                    );
                                  });
                            })),
              ],
            ),
          ),
        ]));
  }
}
