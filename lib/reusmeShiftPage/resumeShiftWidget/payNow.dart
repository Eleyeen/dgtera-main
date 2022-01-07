import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/cardDetail.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/customer.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/customerTable.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/dateAndTime.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/payButton.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/table.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/totleDetail.dart';
import 'package:dgtera_tablet_app/widgets/appbar.dart';
import 'package:dgtera_tablet_app/widgets/drawer.dart';
import 'package:dgtera_tablet_app/widgets/global.dart';
import 'package:flutter/material.dart';

class PayNowScreen extends StatefulWidget {

  @override
  _PayNowScreenState createState() => _PayNowScreenState();
}

class _PayNowScreenState extends State<PayNowScreen> {
  Widget appBarTitle = Text(
    "My Properties",
    style: TextStyle(color: Colors.white),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.orange,
  );

  TextEditingController cashpriceController = TextEditingController();
  TextEditingController creditpriceController = TextEditingController();
  TextEditingController splitinController = TextEditingController();
  TextEditingController voucherController = TextEditingController();
  double? price=0;

  @override
  void initState() {
    setPrice();
    super.initState();
  }
  setPrice(){
    setState(() {
      price = getpricedetails();
    });
  }
  double? getpricedetails(){
    double? totalprice=0;
    selectedItems.forEach((element) {
      setState(() {
        totalprice = totalprice! + element.foodPrice!;
      });
    });
    return totalprice;
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
  body(){
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
                Expanded(child:CardDetail()),
                TotleDetail(),
                SizedBox(height: 20,),

                SizedBox(height: 20,),
                PayButton(),
              ],
            ),
          ),
        ),
        // SizedBox(
        //   width: 8,
        // ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              // color: Colors.grey[300],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text(
                                "$price SR",
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 60,
                                width: 190,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(16)),
                                child: TextField(
                                  controller: cashpriceController,
                                  decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 2),
                                        ),
                                        focusedBorder:OutlineInputBorder(
                                          borderSide:  BorderSide(color: Colors.grey.shade900, width: 2.0),
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        labelStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black),
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 15),
                                        // icon: Icon(Icons.mail),                                          
                                        hintText: 'Enter Cash Amount',
                                        labelText: 'Cash',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade900,
                                              width: 2),

                                        )),
                                          style:TextStyle(
                                          color: Colors.black,
                                        ),
                                        keyboardType:TextInputType.number,
   
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            
                            Container(
                                height: 60,
                                width: 190,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(16)),
                                child: TextField(
                                  controller: splitinController,
                                  // decoration: InputDecoration(
                                  //     hintText: "  No of persons",
                                  //     border: InputBorder.none),

                                decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 2),
                                        ),
                                        focusedBorder:OutlineInputBorder(
                                          borderSide:  BorderSide(color: Colors.grey.shade900, width: 2.0),
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        labelStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black),
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 15),
                                        // icon: Icon(Icons.mail),                                          
                                        hintText: 'No of person',
                                        labelText: 'Split in',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade900,
                                              width: 2),
                                        )),
 style:TextStyle(
                                          color: Colors.black,
                                        ),
                                        keyboardType:TextInputType.number,
   
                                )),
                            SizedBox(
                              width: 10,
                            ),

                            Container(
                                height: 60,
                                width: 190,
                            
                                decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(16)),
                                child: TextField(
                                  controller: creditpriceController,
                                 decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: BorderSide(
                                              color: Colors.black,
                                              width: 2),
                                        ),
                                        focusedBorder:OutlineInputBorder(
                                          borderSide:  BorderSide(color: Colors.grey.shade900, width: 2.0),
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        labelStyle: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black),
                                        hintStyle: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 15),
                                        // icon: Icon(Icons.mail),                                          
                                        hintText: 'Enter Cradit Amount',
                                        labelText: 'Cradit',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          borderSide: BorderSide(
                                              color: Colors.grey.shade900,
                                              width: 2),
                                        )),
                                         style:TextStyle(
                                          color: Colors.black,
                                        ),
                                        keyboardType:TextInputType.number,
   

                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            flex: 6,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                        Container(
      // width: 300,                    
                                        height: 70,
                                        decoration: BoxDecoration(

                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(16)),
                                        child: TextField(
                                    controller: voucherController,
                                  decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 2),
                                          ),
                                          focusedBorder:OutlineInputBorder(
                                            borderSide:  BorderSide(color: Colors.grey.shade900, width: 2.0),
                                            borderRadius: BorderRadius.circular(16),
                                          ),
                                          labelStyle: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 15),
                                          // icon: Icon(Icons.mail),                                          
                                          hintText: 'Enter Voucher',
                                          labelText: 'Voucher',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide(
                                                color: Colors.grey.shade900,
                                                width: 2),
                                          )),
                                          style:TextStyle(
                                            color: Colors.black,
                                          ),
                                          keyboardType:TextInputType.number,
                                  ),
    ),
    SizedBox(height:8),
                                                      
                                      payNowBox(
                                          "walk-in customer", Icons.people),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      payNowBox(
                                          "Voucher", Icons.view_day_outlined),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      payNowBox("Lead team", Icons.group),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      payNowBox("Note", Icons.note_add),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      payNowBox("invoice", Icons.inventory_2),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          dialkeyPayment("1"),
                                          dialkeyPayment("2"),
                                          dialkeyPayment("3"),
                                          dialkeyPayment("+10")
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          dialkeyPayment("4"),
                                          dialkeyPayment("5"),
                                          dialkeyPayment("6"),
                                          dialkeyPayment("+20")
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          dialkeyPayment("7"),
                                          dialkeyPayment("8"),
                                          dialkeyPayment("9"),
                                          dialkeyPayment("+50")
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          dialkeyPayment("+/-"),
                                          dialkeyPayment("0"),
                                          dialkeyPayment("."),
                                          dialkeyPayment("del")
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(16)),
                                          child: Center(
                                            child: Text(
                                              "C",
                                              style: TextStyle(
                                                  color: Colors.grey[600],
                                                  fontSize: 20),
                                            ),
                                          )),
                                          SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                          width: MediaQuery.of(context)
                                              .size
                                              .width,
                                          height: 70,
                                          decoration: BoxDecoration(
                                              color: Colors.blue[100],
                                              borderRadius:
                                              BorderRadius.circular(16)),
                                          child: Center(
                                            child: Text(
                                              "Order",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 25,
                                                  fontWeight:FontWeight.bold,)
                                            ),
                                          ))
                                    ]))
                              ],
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 1.26,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "Payment Method",
                                  style: TextStyle(
                                      color: Colors.grey[600], fontSize: 20),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  pamentMethodBox(
                                      "Card", Icons.local_atm_outlined),
                                  pamentMethodBox(
                                      "Debit cart", Icons.credit_card),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  pamentMethodBox(
                                      "Card", Icons.local_atm_outlined),
                                  pamentMethodBox(
                                      "Debit cart", Icons.credit_card),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  pamentMethodBox(
                                      "Card", Icons.local_atm_outlined),
                                  pamentMethodBox(
                                      "Debit cart", Icons.credit_card),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  pamentMethodBox(
                                      "Card", Icons.local_atm_outlined),
                                  pamentMethodBox(
                                      "Debit cart", Icons.credit_card),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              pamentMethodBox(
                                  "Card", Icons.local_atm_outlined),
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Container dialkeyPayment(String text) {
    return Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.grey[600], fontSize: 20),
          ),
        ));
  }

  Container payNowBox(String text, IconData icon) {
    return Container(
      // width: 300,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: ListTile(
            leading: Icon(
              icon,
              color: Colors.grey,
            ),
            title: Text(
              text,
              style: TextStyle(color: Colors.grey[600], fontSize: 20),
            )),
      ),
    );
  }

  Container pamentMethodBox(String text, IconData icon) {
    return Container(
      // width: 300,
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: Colors.blue[100], borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.grey,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget payDetail() {
    return GestureDetector(
      onTap: () {
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
                "0 SAR >",
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

  void dialog() {
    showDialog(
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
                  Text(
                    "Take Away",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2b0042)),
                  ),
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
