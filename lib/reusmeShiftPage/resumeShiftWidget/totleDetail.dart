import 'dart:ffi';

import 'package:dgtera_tablet_app/widgets/global.dart';
import 'package:flutter/material.dart';


class TotleDetail extends StatefulWidget {
  const TotleDetail({Key? key}) : super(key: key);
  @override
  _TotleDetailState createState() => _TotleDetailState();
}

class _TotleDetailState extends State<TotleDetail> {
  @override
  void initState() {
    super.initState();
  }
  double? getpricedetails(){
    double totalprice=0;
    selectedItems.forEach((element) {
      setState(() {
        totalprice = (totalprice + (element.foodPrice!));
      });
    });
    return totalprice;
  }

  @override
  Widget build(BuildContext context) {
    num? totalitems = selectedItems.length ;
    double? totalprice = getpricedetails();
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
                    Text("Total ($totalitems items)",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[600])),
                    Spacer(),
                    Text("$totalprice",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[600])),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("tax",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[600])),
                    Spacer(),
                    Text("0",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[600])),
                  ],
                ),
              ),

            ),
            Divider(),
          ],

        ),
      ),
    );
  }
}



