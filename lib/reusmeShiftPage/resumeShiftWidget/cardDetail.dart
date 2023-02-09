import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dgtera_tablet_app/DB_Helper/db_helper.dart';
import 'package:dgtera_tablet_app/Models/CatProductModel.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/modle/shiftItemsModle.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShift.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/cardScreen.dart';
import 'package:dgtera_tablet_app/widgets/global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardDetail extends StatefulWidget {
  int? index;

  CardDetail({
    this.index,
  });

  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  int count = 0;
  String? tableid;
  String? tablenum;
  void sharedd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tableid = prefs.getString('tableid');
      tablenum = prefs.getString('tablenum');
      print('cardDetaillllllllll ${tableid.toString()}');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharedd();
  }

  @override
  Widget build(BuildContext context) {
    return bodyy();
  }

  bodyy() {
    List<String>? list;

    return 
    Container(
        height: 350,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("task")
                .where('tableId', isEqualTo: tableid)
                .where('floorNum', isEqualTo: tablenum)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      // for (int i = 0; snapshot.data?.docs.length != null; i++) {
                      //   list = snapshot.data!.docs[index]['floorNum'];
                      //   print('sahsshhshshshshbdhsbdhsbhdbshdb ${list}');
                      // }
                      // list = snapshot.data!.docs[index]['floorNum'];
                      // print('sahsshhshshshshbdhsbdhsbhdbshdb ${list}');

                      count++;
                      return Card(
                        elevation: 0,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.grey)),
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 23,
                                    child: Text(
                                        // "${selectedItems[index].foodName.toString()}",
                                        data['itemName'].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        // maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.grey[600])),
                                  ),
                                  Row(
                                    children: [
                                      Text(data['itemSize'].toString(),

                                          // "${selectedItems[index].size.toString()} ",
                                          overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.grey[600])),
                                      Container(
                                        width: 60,
                                        height: 20,
                                        child: Text(data['itemNote'].toString(),
                                            // "${selectedItems[index].note.toString()}",
                                            overflow: TextOverflow.ellipsis,
                                            // maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.grey[600])),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          // selectedItems[index]
                                          //     .totalPrice
                                          //     .toString(),
                                          data['totalPrice'].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.grey[600])),
                                      Text(" | ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.grey[600])),
                                      Text("dis: ",
                                          overflow: TextOverflow.ellipsis,
                                          // maxLines: 1,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.grey[600])),
                                      Container(
                                        width: 60,
                                        height: 20,
                                        child: Text(
                                            data['itemDiscount'].toString(),

                                            // "${selectedItems[index].discount.toString()}",
                                            overflow: TextOverflow.ellipsis,
                                            // maxLines: 1,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.grey[600])),
                                      ),
                                    ],
                                  ),
                                  Text(data['itemQty'].toString(),

                                      // "quantity: ${selectedItems[index].quantity.toString()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.grey[600])),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text(
                                              "Delete",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, false);
                                                  },
                                                  child: Text(
                                                    "No",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  )),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      FirebaseFirestore.instance
                                                          .collection("task")
                                                          .doc(snapshot.data!
                                                              .docs[index].id
                                                              .toString())
                                                          .delete();
                                                      Navigator.pop(
                                                          context, false);
                                                    });
                                                  },
                                                  child: Text(
                                                    "Yes",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ))
                                            ],
                                            content: Text(
                                                "Are you sure you want to delete this Item"),
                                          ));
                                },
                                child: Icon(Icons.delete),
                              )
                            ],
                          ),
                        ),
                      );
                    });
              }
            }));
  }

  body() {
    return Container(
        height: 350,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: ListView.builder(
            itemCount: selectedItems.length,
            itemBuilder: (context, index) {
              count++;
              return Card(
                elevation: 0,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey)),
                        child: Center(
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                        height: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 23,
                            child: Text(
                                "${selectedItems[index].foodName.toString()}",
                                overflow: TextOverflow.ellipsis,
                                // maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.grey[600])),
                          ),
                          Row(
                            children: [
                              Text("${selectedItems[index].size.toString()} ",
                                  overflow: TextOverflow.ellipsis,
                                  // maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.grey[600])),
                              Container(
                                width: 60,
                                height: 20,
                                child: Text(
                                    "${selectedItems[index].note.toString()}",
                                    overflow: TextOverflow.ellipsis,
                                    // maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.grey[600])),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(selectedItems[index].totalPrice.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.grey[600])),
                              Text(" | ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.grey[600])),
                              Text("dis: ",
                                  overflow: TextOverflow.ellipsis,
                                  // maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.grey[600])),
                              Container(
                                width: 60,
                                height: 20,
                                child: Text(
                                    "${selectedItems[index].discount.toString()}",
                                    overflow: TextOverflow.ellipsis,
                                    // maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.grey[600])),
                              ),
                            ],
                          ),
                          Text(
                              "quantity: ${selectedItems[index].quantity.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.grey[600])),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      "Delete",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context, false);
                                          },
                                          child: Text(
                                            "No",
                                            style:
                                                TextStyle(color: Colors.black),
                                          )),
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              selectedItems
                                                  .remove(selectedItems[index]);

                                              Navigator.pop(context, false);
                                            });
                                          },
                                          child: Text(
                                            "Yes",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ))
                                    ],
                                    content: Text(
                                        "Are you sure you want to delete this Item"),
                                  ));
                        },
                        child: Icon(Icons.delete),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  Future saveSPUserLog(String? totalItemss) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('totalItems', totalItemss.toString());
  }
}
