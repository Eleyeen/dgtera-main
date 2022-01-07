import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/cardDetail.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/customer.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/customerTable.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/dateAndTime.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/payButton.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/payNow.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/product.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/table.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/totleDetail.dart';
import 'package:dgtera_tablet_app/widgets/appbar.dart';
import 'package:dgtera_tablet_app/widgets/drawer.dart';
import 'package:dgtera_tablet_app/widgets/global.dart';
import 'package:flutter/material.dart';

class ResumeScreen extends StatefulWidget {
  @override
  _ResumeScreenState createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  // Icon actionIcon = Icon(
  //   Icons.search,
  //   color: Colors.orange,
  // );

  // Widget appBarTitle = Text(
  //   "My Properties",
  //   style: TextStyle(color: Colors.white),
  // );

  @override
  void initState() {
    getpricedetails();
    super.initState();
  }

  getpricedetails() {
    selectedItems.forEach((element) {
      setState(() {
        totalPriceItem = totalPriceItem! + element.foodPrice!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBarScreen(),
      body:body(),
      drawer: MyDrawer(),
    );
  }
  body() {
    getpricedetails();
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width - 850,
            child: Column(
              children: [
                CustomerTable(),
                SizedBox(
                  height: 8,
                ),
                DateAndTime(),
                SizedBox(height: 10,),
                Expanded(child: CardDetail()),
                TotleDetail(),
                SizedBox(height: 20,),

                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text("Voucher",
                //         style: TextStyle(
                //             color: Colors.black, fontSize: 17)),
                //     SizedBox(width: 10),
                //     Container(
                //         height: 40,
                //         width: 230,
                //         color: Colors.white,
                //         child: Padding(
                //           padding:
                //           const EdgeInsets.only(left: 8.0),
                //           child: TextField(

                //             decoration: InputDecoration(
                //                 hintText: "  Enter voucher",
                //                 border: InputBorder.none),
                //           ),
                //         )),
                //   ],
                // ),
  
                SizedBox(height: 20,),

                PayButton(),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(child: Product())
      ],
    );
  }
}




