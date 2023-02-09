import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dgtera_tablet_app/Models/orderAllModel.dart';
import 'package:dgtera_tablet_app/history/PaidHistory.dart';
import 'package:dgtera_tablet_app/history/SyncedHistory.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:http/http.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Session",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          value: "Session"),
      DropdownMenuItem(child: Text("User1"), value: "User1"),
      DropdownMenuItem(child: Text("User2"), value: "User2"),
      DropdownMenuItem(child: Text("User3"), value: "User3"),
      DropdownMenuItem(child: Text("User4"), value: "User4"),
      DropdownMenuItem(child: Text("User5"), value: "User5"),
    ];
    return menuItems;
  }

  String selectedValue = "Session";

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  DateTime selectedDate1 = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate1)
      setState(() {
        selectedDate1 = picked;
      });
  }

  late TabController _controller;
  String? _chosenValue;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

  var data2;
  List<OrderAllModel> allProductList = [];

  Future<List<OrderAllModel>> getAllProducts() async {
    final response =
        await get(Uri.parse('https://api.woga-pos.com/show_order.php'));
    data2 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      allProductList.clear();
      for (Map i in data2) {
        allProductList.add(OrderAllModel.fromJson(i));
      }
      // setState(() {});
      return allProductList;
    } else {
      return allProductList;
    }
  }

  int count = 0;
  int indexx = 0;
  int conTan = 0;
  double heii = 0;

  @override
  Widget build(BuildContext context) {
    heii = conTan * 50;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "History",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.grey[200],
              child: Column(
                children: [
                  new Container(
                    height: 50,
                    decoration: new BoxDecoration(color: Colors.grey[300]),
                    child: new TabBar(
                      labelColor: Colors.black,
                      labelStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _controller,
                      unselectedLabelColor: Colors.grey,
                      unselectedLabelStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      dragStartBehavior: DragStartBehavior.start,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey, width: 1),
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      tabs: [
                        Tab(
                          child: Text("Order History"),
                        ),
                        //  Tab(
                        //     text: 'Order Return',
                        //   ),
                        // new Tab(
                        //   text: 'Pending',
                        // ),
                        // new Tab(
                        //   text: 'Void',
                        // ),
                        // new Tab(
                        //   text: 'Rejected',
                        // ),
                        // new Tab(
                        //   text: 'All',
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Expanded(
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                _selectDate(context);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey.shade300)),
                              child: Text("From:",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(width: 12),
                            Text(
                              ("${selectedDate.toLocal()}".split(' ')[0]),
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            TextButton(
                              onPressed: () {
                                selectDate(context);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.grey.shade300)),
                              child: Text("To:",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(("${selectedDate1.toLocal()}".split(' ')[0]),
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              "Shift:",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Text("1 - 2021-09-02 03:45AM",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButton(
                            iconEnabledColor: Colors.black,
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            underline: SizedBox(),

                            //elevation: 5,
                            style: TextStyle(color: Colors.black),
                            value: selectedValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            items: dropdownItems,
                            // hint: Align(
                            //      alignment: Alignment.centerLeft,
                            //                     child: Text(
                            //                       "Session",

                            //                     ),
                            //                   ),
                          )),
                      // SizedBox(width: 8,),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButton<String>(
                            iconEnabledColor: Colors.black,
                            dropdownColor: Colors.white,
                            isExpanded: true,
                            underline: SizedBox(),
                            value: _chosenValue,
                            //elevation: 5,
                            style: TextStyle(color: Colors.black),

                            items: <String>[
                              'Credit',
                              'Cash',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            hint: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Sale Report",
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _chosenValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 600,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                        hintText: "Search ",
                        hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  //               Container(
                  //   child: Row(
                  //     children: [
                  //       Icon(Icons.search_outlined),
                  //       // TextField(
                  //       // )
                  //     ],
                  //   ),
                  // ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Container(
                  //     height: 80.0,
                  //     child: TabBarView(
                  //       controller: _controller,
                  //       children: <Widget>[
                  //         // Synced(),
                  //         Paid(),
                  //         // Pending(),
                  //         // Void(),
                  //         // Rejected(),
                  //         // All()
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  Expanded(
                      child: FutureBuilder(
                          future: getAllProducts(),
                          builder: (context, snapshot) {
                            return ListView.builder(
                              // gridDelegate:
                              //     SliverGridDelegateWithFixedCrossAxisCount(
                              // crossAxisCount: 1),
                              shrinkWrap: true,
                              itemCount: allProductList.length,
                              itemBuilder: (context, index) {
                                count++;
                                return Card(
                                  margin: EdgeInsets.fromLTRB(7, 7, 5, 7),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        indexx = index;
                                        heii = conTan * 50;
                                      });

                                      // print(allProductList[index]
                                      //     .dineprice
                                      //     .toString());
                                      // //add in the list
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (builder) =>
                                      //             CardScreen(
                                      //               catProductModel:
                                      //                   allProductList[index],
                                      //               index: index,
                                      //             )));
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        // Container(
                                        //     width: MediaQuery.of(context).size.width,
                                        //     height: 70,
                                        //     child: Center(
                                        //         child: Text(
                                        //       "Order[2]",
                                        //       style: TextStyle(
                                        //         fontWeight: FontWeight.bold,
                                        //         fontSize: 20,
                                        //         color: Colors.black
                                        //       ),
                                        //     ))),
                                        // SizedBox(height: 8,),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Colors.white),
                                              // color: Colors.white,
                                              height: 70,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 8),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                              "ID",
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                            Text(
                                                              (index + 1)
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .grey),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    indent: 20,
                                                    endIndent: 20,
                                                    thickness: 2,
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          "Title",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color:
                                                                  Colors.grey),
                                                        ),
                                                        Text(
                                                          allProductList[index]
                                                              .customer
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.grey),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    indent: 20,
                                                    endIndent: 20,
                                                    thickness: 2,
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Text(
                                                            "Order",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          Text(
                                                            allProductList[
                                                                    index]
                                                                .order_id
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .grey),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    indent: 20,
                                                    endIndent: 20,
                                                    thickness: 2,
                                                  ),
                                                  Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            Text(
                                                              "Time",
                                                              style: TextStyle(
                                                                  fontSize: 20,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                            Text(
                                                              allProductList[
                                                                      index]
                                                                  .times
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .grey),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                  VerticalDivider(
                                                    indent: 20,
                                                    endIndent: 20,
                                                    thickness: 2,
                                                  ),
                                                  Expanded(
                                                      flex: 5,
                                                      child: Container(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 16),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Text(
                                                                "Totle",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              Text(
                                                                allProductList[
                                                                        index]
                                                                    .price
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .grey),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ))
                                                ],
                                              )),
                                        ),
                                        Container()
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }))
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: getAllProducts(),
                  builder: (context, snapshot) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              color: Colors.grey.shade400,
                              child: Center(
                                  child: Text(
                                "Orders",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              color: Colors.grey[300],
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, top: 4, bottom: 4),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      width: 180,
                                      // ignore: deprecated_member_use
                                      child: ElevatedButton(
                                        onPressed: () => {},
                                        // color: Colors.white,

                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.print,
                                                color: Colors.grey),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Print",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/woga.jpg',
                              width: 150,
                              height: 150,
                            ),
                            Container(
                              // color: Colors.amber,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Order Id : ${allProductList[indexx].order_id} ',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Text(
                                    'Date And Time :  ${allProductList[indexx].dates} ',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10, bottom: 10),
                                child: Text(
                                  'Customer Name : ${allProductList[indexx].customer} ',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 35.0, top: 10),
                                child: Text(
                                  'items ',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 9,

                                      // offset: Offset(0, 8), // Shadow position
                                    ),
                                  ],
                                ),
                                height: heii,
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: allProductList[indexx]
                                      .items!
                                      .split(',')
                                      .length,
                                  itemBuilder: (context, index) {
                                    conTan = index;

                                    print(
                                        'shshhshshshshsh${allProductList[indexx].items!.split(',').length}');
                                    return Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 10, bottom: 10),
                                        child: Text(
                                          ' ${allProductList[indexx].items!.split(',')[conTan]}',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            // Container(
                            //   height: 190,
                            //   decoration: BoxDecoration(
                            //       color: Colors.white,
                            //       borderRadius: BorderRadius.only(
                            //           topLeft: Radius.circular(16),
                            //           topRight: Radius.circular(16))),
                            //   child: StreamBuilder<QuerySnapshot>(
                            //       stream: FirebaseFirestore.instance
                            //           .collection("task")
                            //           // .where('tableId', isEqualTo: tableid)
                            //           // .where('floorNum', isEqualTo: tablenum)
                            //           .snapshots(),
                            //       builder: (context, snapshot) {
                            //         if (snapshot.connectionState ==
                            //                 ConnectionState.waiting &&
                            //             snapshot.data == null) {
                            //           return Center(
                            //             child: CircularProgressIndicator(),
                            //           );
                            //         } else {
                            //           return ListView.builder(
                            //               itemCount: snapshot.data?.docs.length,
                            //               itemBuilder: (context, index) {
                            //                 DocumentSnapshot data =
                            //                     snapshot.data!.docs[index];
                            //                 // for (int i = 0; snapshot.data?.docs.length != null; i++) {
                            //                 //   list = snapshot.data!.docs[index]['floorNum'];
                            //                 //   print('sahsshhshshshshbdhsbdhsbhdbshdb ${list}');
                            //                 // }
                            //                 // list = snapshot.data!.docs[index]['floorNum'];
                            //                 // print('sahsshhshshshshbdhsbdhsbhdbshdb ${list}');
                            //                 count++;
                            //                 return Card(
                            //                   elevation: 0,
                            //                   child: Padding(
                            //                     padding: EdgeInsets.all(8),
                            //                     child: Row(
                            //                       mainAxisSize:
                            //                           MainAxisSize.max,
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment
                            //                               .spaceAround,
                            //                       crossAxisAlignment:
                            //                           CrossAxisAlignment.start,
                            //                       children: [
                            //                         Container(
                            //                           width: 45,
                            //                           height: 45,
                            //                           decoration: BoxDecoration(
                            //                               shape:
                            //                                   BoxShape.circle,
                            //                               border: Border.all(
                            //                                   color:
                            //                                       Colors.grey)),
                            //                           child: Center(
                            //                             child: Text(
                            //                               (index + 1)
                            //                                   .toString(),
                            //                               style: TextStyle(
                            //                                   fontSize: 30,
                            //                                   color:
                            //                                       Colors.black),
                            //                             ),
                            //                           ),
                            //                         ),
                            //                         SizedBox(
                            //                           width: 20,
                            //                           height: 20,
                            //                         ),
                            //                         Column(
                            //                           children: [
                            //                             Container(
                            //                               width: 80,
                            //                               height: 23,
                            //                               child: Text(
                            //                                   // "${selectedItems[index].foodName.toString()}",
                            //                                   data['itemName']
                            //                                       .toString(),
                            //                                   overflow:
                            //                                       TextOverflow
                            //                                           .ellipsis,
                            //                                   // maxLines: 1,
                            //                                   style: TextStyle(
                            //                                       fontWeight:
                            //                                           FontWeight
                            //                                               .bold,
                            //                                       fontSize: 20,
                            //                                       color: Colors
                            //                                               .grey[
                            //                                           600])),
                            //                             ),
                            //                             Row(
                            //                               children: [
                            //                                 Text(
                            //                                     data['itemSize']
                            //                                         .toString(),
                            //                                     // "${selectedItems[index].size.toString()} ",
                            //                                     overflow:
                            //                                         TextOverflow
                            //                                             .ellipsis,
                            //                                     // maxLines: 1,
                            //                                     style: TextStyle(
                            //                                         fontWeight:
                            //                                             FontWeight
                            //                                                 .bold,
                            //                                         fontSize:
                            //                                             15,
                            //                                         color: Colors
                            //                                                 .grey[
                            //                                             600])),
                            //                                 Container(
                            //                                   width: 60,
                            //                                   height: 20,
                            //                                   child: Text(
                            //                                       data['itemNote']
                            //                                           .toString(),
                            //                                       // "${selectedItems[index].note.toString()}",
                            //                                       overflow:
                            //                                           TextOverflow
                            //                                               .ellipsis,
                            //                                       // maxLines: 1,
                            //                                       style: TextStyle(
                            //                                           fontWeight:
                            //                                               FontWeight
                            //                                                   .bold,
                            //                                           fontSize:
                            //                                               15,
                            //                                           color: Colors
                            //                                                   .grey[
                            //                                               600])),
                            //                                 ),
                            //                               ],
                            //                             ),
                            //                           ],
                            //                         ),
                            //                         Column(
                            //                           children: [
                            //                             Row(
                            //                               children: [
                            //                                 Text(
                            //                                     // selectedItems[index]
                            //                                     //     .totalPrice
                            //                                     //     .toString(),
                            //                                     data['totalPrice']
                            //                                         .toString(),
                            //                                     style: TextStyle(
                            //                                         fontWeight:
                            //                                             FontWeight
                            //                                                 .bold,
                            //                                         fontSize:
                            //                                             18,
                            //                                         color: Colors
                            //                                                 .grey[
                            //                                             600])),
                            //                                 Text(" | ",
                            //                                     style: TextStyle(
                            //                                         fontWeight:
                            //                                             FontWeight
                            //                                                 .bold,
                            //                                         fontSize:
                            //                                             18,
                            //                                         color: Colors
                            //                                                 .grey[
                            //                                             600])),
                            //                                 Text("dis: ",
                            //                                     overflow:
                            //                                         TextOverflow
                            //                                             .ellipsis,
                            //                                     // maxLines: 1,
                            //                                     style: TextStyle(
                            //                                         fontWeight:
                            //                                             FontWeight
                            //                                                 .bold,
                            //                                         fontSize:
                            //                                             18,
                            //                                         color: Colors
                            //                                                 .grey[
                            //                                             600])),
                            //                                 Container(
                            //                                   width: 60,
                            //                                   height: 20,
                            //                                   child: Text(
                            //                                       data['itemDiscount']
                            //                                           .toString(),
                            //                                       // "${selectedItems[index].discount.toString()}",
                            //                                       overflow:
                            //                                           TextOverflow
                            //                                               .ellipsis,
                            //                                       // maxLines: 1,
                            //                                       style: TextStyle(
                            //                                           fontWeight:
                            //                                               FontWeight
                            //                                                   .bold,
                            //                                           fontSize:
                            //                                               18,
                            //                                           color: Colors
                            //                                                   .grey[
                            //                                               600])),
                            //                                 ),
                            //                               ],
                            //                             ),
                            //                             Text(
                            //                                 data['itemQty']
                            //                                     .toString(),
                            //                                 // "quantity: ${selectedItems[index].quantity.toString()}",
                            //                                 style: TextStyle(
                            //                                     fontWeight:
                            //                                         FontWeight
                            //                                             .bold,
                            //                                     fontSize: 18,
                            //                                     color:
                            //                                         Colors.grey[
                            //                                             600])),
                            //                           ],
                            //                         ),
                            //                         SizedBox(
                            //                           width: 15,
                            //                           height: 20,
                            //                         ),
                            //                         GestureDetector(
                            //                           onTap: () {
                            //                             showDialog(
                            //                                 context: context,
                            //                                 builder:
                            //                                     (context) =>
                            //                                         AlertDialog(
                            //                                           title:
                            //                                               Text(
                            //                                             "Delete",
                            //                                             style: TextStyle(
                            //                                                 color:
                            //                                                     Colors.black),
                            //                                           ),
                            //                                           actions: <
                            //                                               Widget>[
                            //                                             ElevatedButton(
                            //                                                 onPressed:
                            //                                                     () {
                            //                                                   Navigator.pop(context, false);
                            //                                                 },
                            //                                                 child:
                            //                                                     Text(
                            //                                                   "No",
                            //                                                   style: TextStyle(color: Colors.black),
                            //                                                 )),
                            //                                             ElevatedButton(
                            //                                                 onPressed:
                            //                                                     () {
                            //                                                   setState(() {
                            //                                                     FirebaseFirestore.instance.collection("task").doc(snapshot.data!.docs[index].id.toString()).delete();
                            //                                                     Navigator.pop(context, false);
                            //                                                   });
                            //                                                 },
                            //                                                 child:
                            //                                                     Text(
                            //                                                   "Yes",
                            //                                                   style: TextStyle(color: Colors.black),
                            //                                                 ))
                            //                                           ],
                            //                                           content: Text(
                            //                                               "Are you sure you want to delete this Item"),
                            //                                         ));
                            //                           },
                            //                           child: Icon(Icons.delete),
                            //                         )
                            //                       ],
                            //                     ),
                            //                   ),
                            //                 );
                            //               });
                            //         }
                            //       }),
                            // ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10, bottom: 10),
                                child: Text(
                                  'Total Price : ${allProductList[indexx].price}',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10, bottom: 10),
                                child: Text(
                                  'Payment Method : ${allProductList[indexx].payments_method}',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10, bottom: 10),
                                child: Text(
                                  'Pay Cash   :  ${allProductList[indexx].pay_cash}',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10, bottom: 10),
                                child: Text(
                                  'Voucher : ${allProductList[indexx].voucher}',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, top: 10, bottom: 10),
                                child: Text(
                                  'Point : ${allProductList[indexx].points}',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            // Align(
                            //   alignment: Alignment.topLeft,
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(
                            //         left: 20.0, top: 10, bottom: 10),
                            //     child: Text(
                            //       'Order Note : ${allProductList[indexx].items!}',
                            //       style: TextStyle(
                            //         fontSize: 15,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: 40,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
