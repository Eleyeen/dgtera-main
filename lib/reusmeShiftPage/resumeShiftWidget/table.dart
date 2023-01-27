import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dgtera_tablet_app/Models/TableModel.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShift.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'addTable.dart';

class TableWidget extends StatefulWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  String dropdownValue = 'Floor One';
  int selectedIndex = 0;
  PageController pageController = new PageController();

  List<TableModel> floorList = [];

  Future<List<TableModel>> getFloor() async {
    final response =
        await get(Uri.parse('https://api.woga-pos.com/show_floors.php'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      floorList.clear();
      for (Map i in data) {
        floorList.add(TableModel.fromJson(i));
      }
      return floorList;
    } else {
      return floorList;
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getFloor();
    });
  }

  List<TableModel> tableList = [];

  Future<List<TableModel>> getTable() async {
    final response = await get(Uri.parse(
        'https://api.woga-pos.com/show_table_individual.php?floor=$dropdownValue'));
    var data1 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      tableList.clear();
      for (Map i in data1) {
        tableList.add(TableModel.fromJson(i));
      }
      return tableList;
    } else {
      return tableList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //app bar
            Container(
              color: Colors.grey[200],
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.75,
                        // height: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                            child: Text(
                          "Floor OUTDOOR",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 200,
                        // height: 80,

                        decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: FutureBuilder(
                              future: getFloor(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return Text('Loading');
                                } else {
                                  return DropdownButton<String>(
                                    // value: dropdownValue,
                                    icon: Icon(
                                      Icons.arrow_downward,
                                      color: Colors.black,
                                    ),
                                    elevation: 16,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    underline: Container(
                                      height: 3,
                                      color: Colors.blue,
                                      child: Text('Select a Floor'),
                                    ),
                                    // value: dropdownValue == ""
                                    //     ? "select a floor"
                                    //     : dropdownValue,
                                    onChanged: (newValue) {
                                      setState(() {
                                        dropdownValue = newValue.toString();
                                      });
                                    },
                                    items: floorList.map((value) {
                                      return DropdownMenuItem(
                                        // enabled: true,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              "Floor ${value.floor.toString()}"),
                                        ),
                                        value: value.floor.toString(),
                                      );
                                    }).toList(),
                                  );
                                }
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      //create table button
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => AddTable()));
                          },
                          child: Container(
                              width: 150,
                              // height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                  child: Text(
                                "Create Table",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ))),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      //close button
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Expanded(
                          child: Container(
                              width: 150,
                              // height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                  child: Text(
                                "Close",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //custom Text
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                          "0",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                          // width: 150,
                          // height: 80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                              child: Text(
                            "Available",
                            style: TextStyle(fontSize: 20),
                          ))),
                      SizedBox(
                        width: 48,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                          "0",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                          // width: 150,
                          // height: 80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                              child: Text(
                            "Reservation",
                            style: TextStyle(fontSize: 20),
                          ))),
                      SizedBox(
                        width: 48,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                          "0",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                          // width: 150,
                          // height: 80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                              child: Text(
                            "On going",
                            style: TextStyle(fontSize: 20),
                          ))),
                      SizedBox(
                        width: 48,
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.orange, shape: BoxShape.circle),
                        child: Center(
                            child: Text(
                          "0",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                          // width: 150,
                          // height: 80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                              child: Text(
                            "Kitchen",
                            style: TextStyle(fontSize: 20),
                          ))),
                    ],
                  ),
                )
              ],
            ),
            //list Of Table
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: FutureBuilder(
                      future: getTable(),
                      builder: (context, snapshot) {
                        return GridView.builder(
                            gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 20,
                              childAspectRatio: 1.3,
                            ),
                            shrinkWrap: true,
                            itemCount: tableList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () async {
                                  print(
                                      'clickkkkkkkkkkkkkkkkkkkk${int.parse(index.toString()) + 1}');

                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString('tableid',
                                      '${int.parse(index.toString()) + 1}');
                                  prefs.setString('tablenum',
                                      tableList[index].floor.toString());

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ResumeScreen(
                                          tableid:
                                              '${int.parse(index.toString()) + 1}',
                                          floornum:
                                              tableList[index].floor.toString(),
                                        ),
                                      ));
                                },
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 100,
                                  children: [
                                    tableList[index].shape.toString() ==
                                            'Circular'
                                        ? Container(
                                            width: 150,
                                            height: 150,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(120)),
                                                color:
                                                    tableList[index].color.toString() == 'Black'
                                                        ? Color(0xff292b2a)
                                                        : Colors.blue),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Table No : ${int.parse(index.toString()) + 1}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "Persons : ${int.parse(tableList[index].people.toString())}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ))
                                        : tableList[index].shape.toString() ==
                                                'Rectangular'
                                            ? Container(
                                                width: 350,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(10)),
                                                    color: tableList[index]
                                                                .color
                                                                .toString() ==
                                                            'Black'
                                                        ? Color(0xff292b2a)
                                                        : Colors.blue),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Table No : ${int.parse(index.toString()) + 1}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Persons : ${int.parse(tableList[index].people.toString())}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ))
                                            : Container(
                                                width: 150,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(Radius.circular(10)),
                                                    color: tableList[index].color.toString() == 'Black' ? Color(0xff292b2a) : Colors.blue),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Table No : ${int.parse(index.toString()) + 1}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "Persons : ${int.parse(tableList[index].people.toString())}",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ))
                                  ],
                                ),
                              );
                            });
                      }),
                  /*   Flexible
                      (
                      child: Wrap(
                        direction: Axis.horizontal,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceBetween,
                        spacing: 150,
                        children: [

                          Container(
                              width: 120,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                  color: Color(0xff292b2a)),
                              child: Center(
                                child: Center(
                                    child: Text(
                                      value.people.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              )) :
                          value.shape.toString() == 'Circular' ?
                          Container(
                              width: 120,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                                  color: Colors.blue),
                              child: Center(
                                child: Center(
                                    child: Text(
                                      value.people.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              )) :
                          Container(
                            width: 340,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                color: Colors.blue),
                            child: Center(
                              child: Center(
                                  child: Text(
                                    value.people.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    );*/
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
