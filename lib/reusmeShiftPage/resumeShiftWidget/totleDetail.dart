import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dgtera_tablet_app/DB_Helper/db_helper.dart';
import 'package:dgtera_tablet_app/Models/TaxModel.dart';
import 'package:dgtera_tablet_app/Provider/tax_provider.dart';
import 'package:dgtera_tablet_app/widgets/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TotleDetail extends StatefulWidget {
  const TotleDetail({Key? key}) : super(key: key);
  @override
  _TotleDetailState createState() => _TotleDetailState();
}

class _TotleDetailState extends State<TotleDetail> {
  // double? getpricedetails() {
  //   double totalprice = 0;
  //   selectedItems.forEach((element) {
  //     setState(() {
  //       totalprice = (totalprice + (element.discount!));
  //     });
  //   });
  //   return totalprice;
  // }

  // String _selectedCategory = '';

  // List a = ['a','b','c','d'];

  String? tableid;
  String? tablenum;
  double? sumTotal = 0.0;
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

  double sum = 0.0;

  Future totalP(String? totalP) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('totalPriceItem', totalP.toString());
  }

  @override
  Widget build(BuildContext context) {
    // final tax = Provider.of<TaxProvider>(context, listen: false);
    // print(tax);

    // num? totalitems = selectedItems.length;
    // double? totalprice = getpricedetails();
    // double totalPriceTax = 0.0;
    // double finalPrice = 0.0;
    // if (tax.tax == null) {
    //   setState(() {
    //     tax.setData(0.0);
    //   });
    // }

    // void totalitem() async {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.setString('totalitem', totalitems.toString());
    // }

    // if (tax.tax != 0.0) {
    //   setState(() {
    //     totalPriceTax = totalprice! / tax.tax!;
    //     finalPrice = totalPriceTax + totalprice;

    //     tax.setTax(finalPrice);
    //   });
    // }

    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.purple[50],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                        height: 350,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16))),
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("task")
                                .where('tableId', isEqualTo: tableid)
                                .where('floorNum', isEqualTo: tablenum)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting &&
                                  snapshot.data == null) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return Text(
                                    "Total (${snapshot.data?.docs.length} items)",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.grey[600]));
                              }
                            })),
                    Spacer(),
                    GestureDetector(
                      child: Container(
                        width: 200,
                        child: FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection('task')
                              .where('tableId', isEqualTo: tableid)
                              .where('floorNum', isEqualTo: tablenum)
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text("Something went wrong");
                            }
                        

                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              snapshot.data!.docs.forEach((doc) {
                                
                                sumTotal = (double.parse(doc["totalPrice"]) +
                                    sumTotal!); // make sure you create the variable sumTotal somewhere
                                totalP(sumTotal.toString());
                              });
                              return Text(
                                  "Sum of all sells:${sumTotal.toString()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[600]));
                            }

                            return Text("loading");
                          },
                        ),
                      ),
                    ),
                    Text("jj",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey[600])),
                  ],
                ),
              ),
            ),
            // Container(
            //     width: MediaQuery.of(context).size.width,
            //     height: 50,
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: /*Container(
            //       color: Colors.white,
            //       height: 40,
            //       child: */ /*FutureBuilder(
            //           future: tax.getData(),
            //           builder: (context, snapshot) {
            //             print(snapshot.data);
            //             if (!snapshot.hasData) {
            //               return Text('Loading');
            //             } else {
            //               return */ /*
            //                 DropdownButton(
            //                 hint: Align(
            //                   alignment: Alignment.centerLeft,
            //                   child: Text(
            //                     'Search by Category',
            //                     style: TextStyle(
            //                         color: Colors.grey[500],
            //                         fontSize: 20,
            //                         fontWeight: FontWeight.bold,
            //                         decoration: TextDecoration.none
            //                     ),
            //                   ),
            //                 ), // Not necessary for Option 1
            //                 // value: _selectedCategory == null ? catList[0].name.toString() : _selectedCategory,
            //                 onChanged: (newValue) {
            //                   setState(() {
            //                     _selectedCategory = newValue.toString();
            //                     print(_selectedCategory);
            //                   });
            //                 },
            //                 items: a.map((catagory) {
            //                   return DropdownMenuItem(
            //                     // enabled: true,
            //                     child: Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Text(catagory.toString()),
            //                     ),
            //                     value: catagory.toString(),
            //                   );
            //                 }).toList(),
            //               )
            //            */ /* }
            //           }),*/ /*
            //     )),*/
            //           Row(
            //         children: [
            //           Text("Tax : ",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 20,
            //                   color: Colors.grey[600])),
            //           // Spacer(),
            //           Text(
            //               tax == null
            //                   ? "0.0%"
            //                   : "${double.parse(tax.tax.toString())}%",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 20,
            //                   color: Colors.grey[600])),
            //           Spacer(),
            //           Text("${double.parse(totalPriceTax.toString())}",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   fontSize: 20,
            //                   color: Colors.grey[600])),
            //         ],
            //       ),
            //     )),

            Divider(),
          ],
        ),
      ),
    );
  }
}
