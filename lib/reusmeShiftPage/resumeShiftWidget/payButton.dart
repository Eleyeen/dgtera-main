import 'dart:ffi';

import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/payNow.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/totleDetail.dart';
import 'package:dgtera_tablet_app/widgets/global.dart';
import 'package:flutter/material.dart';


class PayButton extends StatefulWidget {
  const PayButton({Key? key}) : super(key: key);

  @override
  _PayButtonState createState() => _PayButtonState();
}

class _PayButtonState extends State<PayButton> {


  @override
  void initState() {
    getpricedetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double? totalprice = getpricedetails();
    return body(totalprice!);
  }
  body(double totalprice){
    return GestureDetector(
      onTap: (){
        dialog();
      },
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            color: Color(0xff2b0042),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pay Now",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "$totalprice SAR >",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
  double? getpricedetails(){
     double totalprice=0;
    selectedItems.forEach((element) {
      setState(() {
        totalprice = totalprice + (element.foodPrice!);
      });
    });
    return totalprice;
  }

  dialog() {
    return showDialog(
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 200,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Order type catogory", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                Divider(),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PayNowScreen()));
                    },
                    child: Text("Dine in", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff2b0042)),)),
                Divider(),
                Text("Take Away", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color(0xff2b0042)),),
              ],
            ),
          ),
        );
      },
      context: context,
    );
  }
}

