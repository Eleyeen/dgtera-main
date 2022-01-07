import 'package:dgtera_tablet_app/reports/reportsList/Stock.dart';
import 'package:dgtera_tablet_app/reports/reportsList/catagorySummaryRange.dart';
import 'package:dgtera_tablet_app/reports/reportsList/productMixRange.dart';
import 'package:dgtera_tablet_app/reports/reportsList/productReturn.dart';
import 'package:dgtera_tablet_app/reports/reportsList/productVoid.dart';
import 'package:dgtera_tablet_app/reports/reportsList/productWaste.dart';
import 'package:dgtera_tablet_app/reports/reportsList/salesReport.dart';
import 'package:dgtera_tablet_app/reports/reportsList/salesReportPos.dart';
import 'package:dgtera_tablet_app/reports/reportsList/salesSummaryReports.dart';
import 'package:dgtera_tablet_app/reports/reportsList/stcPayment.dart';
import 'package:dgtera_tablet_app/reports/reportsList/discountReports.dart';
import 'package:dgtera_tablet_app/reports/reportsList/tilloperation.dart';
import 'package:dgtera_tablet_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Zreport extends StatefulWidget {
  const Zreport({Key? key}) : super(key: key);

  @override
  _ZreportState createState() => _ZreportState();
}

class _ZreportState extends State<Zreport> {

  itemTextStyle(double? leterspace,double? sizee){
    return TextStyle(fontSize: sizee,fontWeight: FontWeight.bold,letterSpacing: leterspace);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: TextButton(
              onPressed: () {},
              child: Center(
                  child: Text(
                    "Print",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ),
          ),
        ],
        title: Text(
            "Z-reports",
            style: TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
        // shape: CustomShapeBorder(),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:70,horizontal: 450),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 58.0,left: 30,right: 30),
            child: Column(
              children: [
                Text("Z-REPORT",style: itemTextStyle(0,30),),
                SizedBox(height: 25,),
                Text("POS/2021/08/17/1477",style: itemTextStyle(1,30)),
                SizedBox(height: 22,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shop",style: itemTextStyle(0,18)),
                    Text("Cashier (Administrator)",style: itemTextStyle(0,18)),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Seller",style: itemTextStyle(0,18)),
                    Text("Administrator",style: itemTextStyle(0,18)),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date",style: itemTextStyle(0,18)),
                    Text("2021-08-24",style: itemTextStyle(0,18)),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Time",style: itemTextStyle(0,18)),
                    Text("09:17:34",style: itemTextStyle(0,18)),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Start At",style: itemTextStyle(0,18)),
                    Text("17/08/2021 09:35:55 AM",style: itemTextStyle(0,18)),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Stop At",style: itemTextStyle(0,18)),
                    Text(" ",style: itemTextStyle(0,18)),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Orders",style: itemTextStyle(0,18)),
                    Text("1",style: itemTextStyle(0,18)),
                  ],
                ),
                SizedBox(height: 32,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cash Register Balance",style: itemTextStyle(0,18)),
                    Text("",style: itemTextStyle(0,18)),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Start",style: itemTextStyle(0,18)),
                    Text("100.0000 SR",style: itemTextStyle(0,18)),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sales Total",style: itemTextStyle(0,18)),
                    Text("226.0000 SR",style: itemTextStyle(0,18)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
