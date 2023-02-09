import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dgtera_tablet_app/DB_Helper/db_helper.dart';
import 'package:dgtera_tablet_app/Models/CatProductModel.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShift.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/cardDetail.dart';

import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/customerTable.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/dateAndTime.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/payButton.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/payNow.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/totleDetail.dart';
import 'package:dgtera_tablet_app/widgets/appbar.dart';
import 'package:dgtera_tablet_app/widgets/drawer.dart';
import 'package:dgtera_tablet_app/widgets/global.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../Models/TaxModel.dart';
import '../modle/shiftItemsModle.dart';

class CardScreen extends StatefulWidget {
  int? index;
  CatProductModel catProductModel;

  CardScreen({required this.catProductModel, this.index});
  @override
  _CardScreenState createState() => _CardScreenState();
}

String itemIncrement = "";

class _CardScreenState extends State<CardScreen> {
  int itemcount = 1;
  String? itmname;
  String size = 'large';
  Item? item;
  bool sizebutton = false;
  String? tableid;
  String? tablenum;

  void sharedd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tableid = prefs.getString('tableid');
      tablenum = prefs.getString('tablenum');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharedd();
  }

  Widget appBarTitle = Text(
    "My Properties",
    style: TextStyle(color: Colors.white),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.orange,
  );
  TextEditingController noteController = TextEditingController();
  TextEditingController discountController =
      TextEditingController(text: 0.toInt().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBarScreen(),
      body: body(),
      drawer: MyDrawer(),
    );
  }

  body() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              children: [
                CustomerTable(),
                SizedBox(
                  height: 8,
                ),
                DateAndTime(),
                Expanded(child: CardDetail()),
                TotleDetail(),
                PayButton(),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    countItem(),
                    sizeboxx(),
                    sizeItem(),
                    sizeboxx(),
                    clearNote(),
                    sizeboxx(),
                    extraSugar(),
                    Row(
                      children: [
                        discountField(),
                        doneButton(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  sizeboxx() {
    return SizedBox(
      height: 2,
    );
  }

  countItem() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Color(0xff2c0c42),
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Center(
                    child: Text(
                      "Back",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ),
            // SizedBox(width: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Text(
                    widget.catProductModel.name.toString().toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[600]),
                  ))),
            ),
            Container(
              width: 100,
              height: 40,
              child: Center(
                  child: Text("Quantity:",
                      style: TextStyle(fontSize: 20, color: Colors.grey[600]))),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  itemcount == 1
                      ? print("not decrementing anymore")
                      : itemcount = itemcount - 1;
                });
              },
              child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                      child: Text(
                    "-",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ))),
            ),

            Container(
              height: 40,
              width: 70,
              child: Center(
                  child: Text(
                "$itemcount",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              )),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  itemcount = itemcount + 1;
                });
              },
              child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                      child: Text(
                    "+",
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ))),
            ),
            SizedBox(
              width: 80,
            ),
            // Expanded(
            //   child: Container(
            //     width: 100,
            //     height: 40,
            //     // ignore: deprecated_member_use
            //     child: ElevatedButton(onPressed: () {}, child: Text("New")),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  sizeItem() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 170,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Size",
              style: TextStyle(fontSize: 20),
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      size = "large";
                      print(size);
                      sizebutton = false;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: 40,
                    color: sizebutton ? Colors.grey[200] : Colors.grey[600],
                    child: Center(
                        child: Text("Large",
                            style: TextStyle(
                                color: sizebutton ? Colors.black : Colors.white,
                                fontSize: 17))),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      size = "small";
                      print(size);
                      sizebutton = true;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: 40,
                    color: sizebutton ? Colors.grey[600] : Colors.grey[200],
                    child: Center(
                        child: Text("Small",
                            style: TextStyle(
                                color: sizebutton ? Colors.white : Colors.black,
                                fontSize: 17))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  clearNote() {
    return Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Center(
                  child: Text("Notes",
                      style: TextStyle(color: Colors.black, fontSize: 17))),
              Spacer(),
              Center(
                  child: Text("Clear notes",
                      style: TextStyle(fontSize: 17, color: Colors.blue))),
            ],
          ),
        ));
  }

  extraSugar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: noteController,
                  maxLength: null,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                      hintText: "> 1-No Suger", border: InputBorder.none),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  discountField() {
    return Expanded(
      // flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Discount",
                  style: TextStyle(color: Colors.black, fontSize: 17)),
            ),
            // SizedBox(height:10),
            Container(
                height: 60,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(4))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    controller: discountController,
                    decoration: InputDecoration(
                        hintText: "  Enter Discount percent",
                        border: InputBorder.none),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // uploadData() {
  //   FirebaseFirestore.instance.collection('items').doc().update({});
  // }

  void setData(String? totalPrice, String? dis) async {
    await Firebase.initializeApp();
    return await FirebaseFirestore.instance.collection('task').doc().set({
      'itemName': widget.catProductModel.name,
      'itemQty': itemcount,
      'itemSize': size,
      'idIndex': widget.index!,
      'itemNote': noteController.text,
      'totalPrice': totalPrice,
      'itemDiscount': dis,
      'itemPrice': double.parse(widget.catProductModel.dineprice.toString()),
      'tableId': '${tableid.toString()}',
      'floorNum': '${tablenum.toString()}',
      'orderComplete': ''
    }).then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => ResumeScreen()));
      print(
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    });
  }

  doneButton() {
    print(
        'doneeeeeeeeeeeeeeeeeeeeeee prrrrrrrrrinttttttttttttttttttttttttttttttttttt');

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 45, 0, 8),
        child: GestureDetector(
          onTap: () async {
            double? dis = double.parse(discountController.text.toString());
            double totalPrice =
                double.parse(widget.catProductModel.dineprice.toString()) *
                    itemcount;
            double disPrice = totalPrice * dis / 100;
            double finalPriceWithDiscount = totalPrice - disPrice;
            // dis = finalPriceWithDiscount;
            // dis = dis - dis;
            // ignore: unnecessary_null_comparison
            if (tableid.toString == null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Select a table"),
              ));
            } else {
              setData(totalPrice.toString(), dis.toString());
            }

            // if (selectedItems.isNotEmpty) {
            //   print("existing itemmmmmmmmmmmmmmmmmm in list is $selectedItems");
            //   var existingiteminList = selectedItems.firstWhere(
            //       (itemToCheck) =>
            //           itemToCheck.foodName == widget.catProductModel.name,
            //       orElse: () => Item(
            //           id: widget.index!,
            //           foodName: '',
            //           foodPrice: double.parse(
            //               widget.catProductModel.dineprice.toString()),
            //           quantity: itemcount,
            //           note: noteController.text,
            //           discount: dis,
            //           size: size,
            //           totalPrice: totalPrice));
            //   print("existing item in list is ${existingiteminList.foodName}");
            //   if (existingiteminList.foodName == widget.catProductModel.name) {
            //     print(
            //         'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ifffffffffffffffff');
            //     setState(() {
            //       selectedItems[widget.index!].discount =
            //           selectedItems[widget.index!].discount! -
            //               selectedItems[widget.index!].discount!;
            //       selectedItems[widget.index!].foodPrice = double.parse(
            //               widget.catProductModel.dineprice.toString()) +
            //           double.parse(
            //               selectedItems[widget.index!].foodPrice.toString());
            //       selectedItems[widget.index!].quantity = itemcount +
            //           int.parse(
            //               selectedItems[widget.index!].quantity.toString());
            //       selectedItems[widget.index!].note = noteController.text;
            //       selectedItems[widget.index!].size = size;
            //       selectedItems[widget.index!].totalPrice = totalPrice +
            //           double.parse(
            //               selectedItems[widget.index!].totalPrice.toString());
            //       double discPrice = selectedItems[widget.index!].totalPrice! *
            //           double.parse(discountController.text.toString()) /
            //           100;
            //       double finallPriceWithDiscount =
            //           selectedItems[widget.index!].totalPrice! - discPrice;
            //       dis = finallPriceWithDiscount;
            //       selectedItems[widget.index!].discount = dis;
            //     });
            //     print('Already exists!');
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (builder) => ResumeScreen()));
            //     print(
            //         'doneeeeeeeeeeeeeeeeeeeeeee adddddddddddddddddd iffffffffffffffffffffffff  seconnnnnnnnddddddddddddddddddddddddddddddddd');
            //   } else {
            //     print(
            //         'Added!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! elseeeeeeeeeeeee');
            //     setState(() async {
            //       selectedItems.add(Item(
            //           id: widget.index!,
            //           foodName: widget.catProductModel.name,
            //           foodPrice: double.parse(
            //               widget.catProductModel.dineprice.toString()),
            //           quantity: itemcount,
            //           note: noteController.text,
            //           discount: dis,
            //           size: size,
            //           totalPrice: totalPrice));
            //       dis = dis! - dis!;

            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (builder) => ResumeScreen()));
            //     });
            //   }

            //   print(
            //       'doneeeeeeeeeeeeeeeeeeeeeee adddddddddddddddddd iffffffffffffffffffffffff  frisssssssssssssssssssssssssttttttttttttt');
            // } else {
            //   print('Added!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
            //   selectedItems.forEach((element) {
            //     print('adddddd databaseeeeeee');
            //     print(element.foodName);
            //   });

            //   print('${widget.catProductModel.name}');
            //   setState(() {
            //     selectedItems.add(Item(
            //         id: widget.index!,
            //         foodName: widget.catProductModel.name,
            //         foodPrice: double.parse(
            //             widget.catProductModel.dineprice.toString()),
            //         quantity: itemcount,
            //         note: noteController.text,
            //         discount: dis,
            //         size: size,
            //         totalPrice: totalPrice));
            //     dis = dis! - dis!;

            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (builder) => ResumeScreen()));
            //   });
            //   print(
            //       'doneeeeeeeeeeeeeeeeeee adddddddddddddddddddddddddd elseeeeeeeeeeeeeeeeee   frisssssssssstttttttttttttttttttttt');
            // }
          },
          child: Container(
            height: 60,
            width: 600,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(
                child: Text(
              "Done",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }

  dialog() {
    return showDialog(
      builder: (BuildContext context) {
        return Positioned(
          top: 10,
          left: 10,
          child: Dialog(
            child: Container(
              height: 200,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Order type catogory",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Divider(),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PayNowScreen()));
                      },
                      child: Text(
                        "Dine in",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2b0042)),
                      )),
                  Divider(),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PayNowScreen()));
                      },
                      child: Text(
                        "Take Away",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2b0042)),
                      )),
                ],
              ),
            ),
          ),
        );
      },
      context: context,
    );
  }
}
