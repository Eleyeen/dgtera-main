import 'package:dgtera_tablet_app/history/PaidHistory.dart';
import 'package:dgtera_tablet_app/history/SyncedHistory.dart';
import 'package:dgtera_tablet_app/history/allHistory.dart';
import 'package:dgtera_tablet_app/history/pendingHisotry.dart';
import 'package:dgtera_tablet_app/history/rejectedhitory.dart';
import 'package:dgtera_tablet_app/history/voidhistory.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  String? _chosenValue;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
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
                      labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _controller,
                      unselectedLabelColor: Colors.grey,
                      unselectedLabelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      dragStartBehavior: DragStartBehavior.start,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey, width: 1),
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                      ),
                      tabs: [
                        new Tab(
                          child: Text("Synced"),
                        ),
                        new Tab(
                          text: 'paid',
                        ),
                        new Tab(
                          text: 'Pending',
                        ),
                        new Tab(
                          text: 'Void',
                        ),
                        new Tab(
                          text: 'Rejected',
                        ),
                        new Tab(
                          text: 'All',
                        ),
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
                            Text("From:",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            SizedBox(width: 12),
                            Text(
                              "02/09/2021",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text("To:",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 12,
                            ),
                            Text("02/09/2021",
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
                              child: Text(
                                  "1 - 2021-09-02 03:45AM",
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
                    width: MediaQuery.of(context).size.width/4,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton<String>(
                      iconEnabledColor: Colors.black,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      underline:SizedBox(),
                      value: _chosenValue,
                      //elevation: 5,
                      style: TextStyle(color: Colors.black),

                      items: <String>[
                        'User 1',
                        'User 2',
                        'User 3',
                        'User 4',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Session",
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
                  // SizedBox(width: 8,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width/4,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton<String>(
                      iconEnabledColor: Colors.black,
                      dropdownColor: Colors.white,
                      isExpanded: true,
                      underline:SizedBox(),
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
                                          hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20
                                          ),
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
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 80.0,
                      child: TabBarView(
                        controller: _controller,
                        children: <Widget>[
                          Synced(),
                          Paid(),
                          Pending(),
                          Void(),
                          Rejected(),
                          All()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.grey.shade400,
                    child: Center(child: Text("Orders",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold),)),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.grey[300],
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12,top: 4,bottom: 4),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            width: 180,
                            // ignore: deprecated_member_use
                            child: FlatButton(
              onPressed: () => {},
              color: Colors.white,
              
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Icon(Icons.print,color:Colors.grey),
                  SizedBox(width: 8,),
                  Text("Print",style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}


