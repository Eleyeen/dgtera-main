

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
   DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      }
      );
  }

  DateTime selectedDate1 = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate1,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate1)
      setState(() {
        selectedDate1 = picked;
      }
      );
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:10,horizontal: 450),
            child: Container(
              child:Row(
                          children: [
                            
                            TextButton(onPressed: (){
                              _selectDate(context);
                            },

                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.grey.shade300)
                            ),
                              child: Text("From:",
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(width: 12),
                            Text(
                              ("${selectedDate.toLocal()}".split(' ')[0]),
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              onPressed: (){
                                selectDate(context);
                              },
                              style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.grey.shade300)
                            ),
                              child: Text("To:",
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(("${selectedDate1.toLocal()}".split(' ')[0]),
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold)),
                            
                          ],
                        ),
  
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:40,horizontal: 450),
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
        ],
      ),
    );
  }
}
