import 'package:flutter/material.dart';

import 'package:dgtera_tablet_app/reusmeShiftPage/modle/shiftItemsModle.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/cardDetail.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/customerTable.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/dateAndTime.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/payButton.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/product.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/totleDetail.dart';
import 'package:dgtera_tablet_app/widgets/appbar.dart';
import 'package:dgtera_tablet_app/widgets/drawer.dart';
import 'package:dgtera_tablet_app/widgets/global.dart';

class ResumeScreen extends StatefulWidget {
  Item? item;
  String? customername;
  ResumeScreen({
    Key? key,
    this.customername,
    this.item,
  }) : super(key: key);
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
      body: body(),
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
            width: MediaQuery.of(context).size.width - 850,
            child: Column(
              children: [
                widget.customername.toString() == ""
                    ? CustomerTable()
                    : CustomerTable(
                        customerName: widget.customername.toString() == ""
                            ? "select a customer"
                            : widget.customername.toString(),
                      ),
                SizedBox(
                  height: 6,
                ),
                DateAndTime(),
                SizedBox(
                  height: 6,
                ),
                Expanded(child: CardDetail()),
                TotleDetail(),
                SizedBox(
                  height: 6,
                ),
                PayButton(),
              ],
            ),
          ),
        ),
        // SizedBox(
        //   width: 8,
        // ),
        Expanded(child: Product())
      ],
    );
  }
}
