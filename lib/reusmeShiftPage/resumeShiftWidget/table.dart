import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
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
                                  color: Colors.black,                                  fontSize: 20,
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
                                child: DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward,color: Colors.black,),
      elevation: 16,
      style:  TextStyle(color: Colors.black,
      fontSize: 20,
      fontWeight:FontWeight.bold,
           ),
      underline: Container(
        height: 3,
        color: Colors.blue,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Floor One', 'Floor Two', 'Floor three', 'Floor Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),),
                          ),
                            SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: (){
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
                          SizedBox(width: 8,),
                          GestureDetector(
                            onTap: (){
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
                )
              ],
            ),
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
            Expanded(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.32,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xff292b2a)),
                                child: Center(
                                    child: Center(child: Text("TABLE [1]",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                )),
                            Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xff292b2a)),
                                child: Center(
                                    child: Center(child: Text("TABLE [2]",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                )),
                            Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xff292b2a)),
                                child: Center(
                                    child: Center(child: Text("TABLE [3]",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                )),
                            Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Color(0xff292b2a)),
                                child: Center(
                                    child: Center(child: Text("TABLE [4]",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                width: 120,
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    color: Colors.blue),
                                child: Center(
                                    child: Center(
                                      child: Text("TABLE [5]",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                                )),
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
                                    "TABLE [6]",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )),
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
                                    "TABLE [7]",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )),
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
                                    "TABLE [8]",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                                    "TABLE [9]",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )),
                            Container(
                              width: 120,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  color: Colors.blue),
                              child: Center(
                                  child: Text(
                                "TABLE [10]",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
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
                                  "TABLE [11]",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            width: 140,
                            height: 350,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.blue,
                            ),
                            child: Center(
                                child: Text(
                              "TABLE [12]",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
