import 'package:dgtera_tablet_app/Models/InsertOrder.dart';
import 'package:dgtera_tablet_app/Provider/DineInProvider.dart';
import 'package:dgtera_tablet_app/Provider/tax_provider.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/cardDetail.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/totleDetail.dart';
import 'package:dgtera_tablet_app/widgets/appbar.dart';
import 'package:dgtera_tablet_app/widgets/drawer.dart';
import 'package:dgtera_tablet_app/widgets/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

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



  List<InsertOrder> orderList = [];
  
  // Future<void> insertOrder() async {
  //   final response = await http.post(Uri.parse("https://api.woga-pos.com/insert_orders.php"),
  //   body: {
  //     'order_id': ,
  //     'customer':,
  //     'dates':,
  //     'items': ,
  //       'quantity': ,
  //       'price':,
  //       'discount':,
  //       'voucher':,
  //       'points':,
  //       'notes':,
  //       'payments_method':,
  //       'users_name':,
  //       'times':,
  //       'pay_cash':,
  //       'pay_card':,
  //       });
  //
  //   if (response.statusCode == 200)
  //     {
  //       print("Success");
  //     }
  //   else{
  //     print("Failed");
  //   }
  // }

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
    final totalPrice = Provider.of<TaxProvider>(context, listen: false);
    final dineIn = Provider.of<DineInProvider>(context, listen: false);

    setState(() {
      creditpriceController.text = dineIn.credit.toString();
    });
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              children: [
                // CustomerTable(),
                    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => Customer()));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.all(Radius.circular(8))),
            width: 210,
            height: 45,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_rounded),
                  SizedBox(width: 8),
                  Text("Costumer Name"),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: (){
            // Navigator.push(context, MaterialPageRoute(builder: (builder)=>TableWidget()));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            width: 210,
            height: 45,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.table_chart),
                  SizedBox(width: 8),
                  Text("Points [99]"),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
 
                // SizedBox(
                //   height: 8,
                // ),
                // DateAndTime(),
                SizedBox(
                  height: 8,
                ),
                Expanded(child:CardDetail()),
                TotleDetail(),
                // SizedBox(height: 20,),
                // PayButton(),
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
                                "${totalPrice.totalTax} SAR",
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
                            Expanded(
                              flex: 1,
                              child: Container(
                                  height: 60,
                                  // width: MediaQuery.of(context).size.width/4.3,
                                  // color: Colors.white,
                                  decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(16)),
                                  child: TextField(
                                    controller: cashpriceController,
                                    onChanged: (value) async {
                                      setState(() {
                                        print("current cash is  ${dineIn.cash}");
                                        if(cashpriceController.text.length > 0) {
                                          dineIn.setCash(double.parse(value));
                                          print("current if cash is  ${dineIn.cash}");
                                          double creditPrice = totalPrice.totalTax! - dineIn.cash!.toDouble();
                                          print(creditPrice);
                                          dineIn.setCredit(creditPrice);
                                        }else{
                                          print("current else cash is  ${dineIn.cash}");
                                          dineIn.setCredit(0.0);
                                          print("current else credit is  ${dineIn.credit}");
                                        }

                                      });

                                    },
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
                            ),
                      
                            

                            SizedBox(
                              width: 10,
                            ),

                            Expanded(
                              child: Container(
                                  height: 60,
                                  // width: MediaQuery.of(context).size.width/4.3,
                              
                                  decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(16)),
                                  child: TextField(
                                    controller: creditpriceController,
                                    onChanged: (text){
                                      setState(() {
                                          text =  dineIn.credit.toString();
                                      });
                                    },
                                   readOnly: true,
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
                                          hintText: 'Enter Credit Amount',
                                          labelText: 'Credit',
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
                            ),
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
                                height: 70,
                                // width: 190,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(16)),
                                child: TextField(
                                  maxLines: 2,
                               controller: splitinController,
                                onChanged: (value){
                                    setState(() {
                                      dineIn.setSplitInPersons(double.parse(value));
                                      double splitInPersonsCash = totalPrice.totalTax! / double.parse(value);
                                      dineIn.setSplit(splitInPersonsCash);
                                    });
                                },
                                decoration: InputDecoration(
                                  isDense: false,
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
                                    SizedBox(height:8),
                                        Container(
                       
                                        height: 70,
                                        decoration: BoxDecoration(

                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(16)),
                                        child: TextField(
                                          maxLines: 2,
                                    controller: voucherController,
                                  onChanged: (value){
                                            setState(() {
                                              dineIn.setVoucher(double.parse(value));
                                            });
                                  },
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
                                                      
                                      GestureDetector(
                                        onTap: (){
                                          dialogBox();
                                        },
                                        child: payNowBox(
                                            "Reedem Points", Icons.point_of_sale),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      // payNowBox("Lead team", Icons.group),
                                      // SizedBox(
                                      //   height: 8,
                                      // ),
                                      Container(

                                        height: 70,
                                        decoration: BoxDecoration(

                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(16)),
                                        child: TextField(
                                          onChanged: (value){
                                            setState(() {
                                              dineIn.setNotes(value);
                                              print(dineIn.notes);
                                            });
                                          },
                                          maxLines: 5,
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
                                              hintText: 'Enter Notes',
                                              labelText: 'Notes',
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
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(

                                        height: 70,
                                        decoration: BoxDecoration(

                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(16)),
                                        child: TextField(
                                          onChanged: (value){
                                            setState(() {
                                              dineIn.setDiscount(double.parse(value));
                                              double finalDiscountprice = totalPrice.totalTax! * double.parse(value)/100;
                                              double finalDiscount = totalPrice.totalTax! - finalDiscountprice;
                                              dineIn.setfinalDiscount(finalDiscount);
                                            });
                                          },
                                          maxLines: 2,
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
                                              hintText: 'Enter Discount',
                                              labelText: 'Discount',
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
                                        ),
                                      ),
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
                                      
                                    ])),
                                  
                              ],
                            )
                            ),
                              GestureDetector(
                                onTap: (){
                                  dialogBox3();
                                },
                                child: Container(
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
                                                "Order Now",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 25,
                                                    fontWeight:FontWeight.bold,)
                                              ),
                                            )),
                              )
 
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
                              Wrap(
                                spacing: 10.0,
                                runSpacing: 10,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      dineIn.setPaymentMethod("PayPal");
                                      print(dineIn.paymentMethod);
                                      setState(() {

                                      });
                                    },
                                    child: pamentMethodBox(
                                        "PayPal", Icons.local_atm_outlined,
                                      dineIn.paymentMethod == "PayPal" ? Colors.blue.shade300 : Colors.white,
                                      dineIn.paymentMethod == "PayPal" ? Colors.blue : Colors.black54,),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      dineIn.setPaymentMethod("Payoneer");
                                      print(dineIn.paymentMethod);
                                      setState(() {

                                      });
                                    },
                                    child: pamentMethodBox(
                                        "Payoneer", Icons.credit_card,
                                      dineIn.paymentMethod == "Payoneer" ? Colors.blue.shade300 : Colors.white,
                                      dineIn.paymentMethod == "Payoneer" ? Colors.blue : Colors.black54,),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      dineIn.setPaymentMethod("Saudi National");
                                      print(dineIn.paymentMethod);
                                      setState(() {

                                      });
                                    },
                                    child: pamentMethodBox(
                                        "Saudi National", Icons.local_atm_outlined,
                                      dineIn.paymentMethod == "Saudi National" ? Colors.blue.shade300 : Colors.white,
                                      dineIn.paymentMethod == "Saudi National" ? Colors.blue : Colors.black54,),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      dineIn.setPaymentMethod("SABB");
                                      print(dineIn.paymentMethod);
                                      setState(() {

                                      });
                                    },
                                    child: pamentMethodBox(
                                        "SABB", Icons.credit_card,
                                      dineIn.paymentMethod == "SABB" ? Colors.blue.shade300 : Colors.white,
                                      dineIn.paymentMethod == "SABB" ? Colors.blue : Colors.black54,),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      dineIn.setPaymentMethod("Alinma");
                                      print(dineIn.paymentMethod);
                                      setState(() {

                                      });
                                    },
                                    child: pamentMethodBox(
                                        "Alinma", Icons.local_atm_outlined,
                                      dineIn.paymentMethod == "Alinma" ? Colors.blue.shade300 : Colors.white,
                                      dineIn.paymentMethod == "Alinma" ? Colors.blue : Colors.black54,),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      dineIn.setPaymentMethod("Riyad");
                                      print(dineIn.paymentMethod);
                                      setState(() {

                                      });
                                    },
                                    child: pamentMethodBox(
                                        "Riyad", Icons.credit_card,
                                      dineIn.paymentMethod == "Riyad" ? Colors.blue.shade300 : Colors.white,
                                      dineIn.paymentMethod == "Riyad" ? Colors.blue : Colors.black54,),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      dineIn.setPaymentMethod("AlJazira");
                                      print(dineIn.paymentMethod);
                                      setState(() {

                                      });
                                    },
                                    child: pamentMethodBox(
                                        "AlJazira", Icons.local_atm_outlined,
                                    dineIn.paymentMethod == "AlJazira" ? Colors.blue.shade300 : Colors.white,
                                    dineIn.paymentMethod == "AlJazira" ? Colors.blue : Colors.black54,)
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      dineIn.setPaymentMethod("AlBilad");
                                      print(dineIn.paymentMethod);
                                      setState(() {

                                      });
                                    },
                                    child: pamentMethodBox(
                                        "AlBilad", Icons.credit_card,
                                      dineIn.paymentMethod == "AlBilad" ? Colors.blue.shade300 : Colors.white,
                                      dineIn.paymentMethod == "AlBilad" ? Colors.blue : Colors.black54,),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      dineIn.setPaymentMethod("Al Rajhi");
                                      print(dineIn.paymentMethod);
                                      setState(() {

                                      });
                                    },
                                    child: pamentMethodBox(
                                        "Al Rajhi", Icons.local_atm_outlined,
                                      dineIn.paymentMethod == "Al Rajhi" ? Colors.blue.shade300 : Colors.white,
                                      dineIn.paymentMethod == "Al Rajhi" ? Colors.blue : Colors.black54,),
                                  ),
                                ],
                              ),

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


  Widget pamentMethodBox(String text, IconData icon, Color boxColor, Color borderColor) {
    final dineIn = Provider.of<DineInProvider>(context, listen: false).paymentMethod;
    return Container(
      // width: 300,
      height: 70,
      width: 70,
      decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(16),
      border: Border.all(color: borderColor)
      ),
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
                textAlign: TextAlign.center,
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

  void dialogBox() {
    showDialog(
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 200,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Are You Sure You Want to Reedem",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  TextButton(
                        child: Text('No'),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blue[300],
                          onSurface: Colors.grey,
                        ),
                        onPressed: () {
                          print('Pressed');
                        },
                      ),
                      
                                      TextButton(
                        child: Text('Yes'),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.blue[300],
                          onSurface: Colors.grey,
                        ),
                        onPressed: () {
                          print('Pressed');
                        },
                      )
                  ],
                ),
                

              ],
            ),
          ),
        );
      },
      context: context,
    );
  }

  void dialogBox3() {
    showDialog(
      builder: (BuildContext context) {
        final dineIn = Provider.of<DineInProvider>(context);
        final price = Provider.of<TaxProvider>(context);
        return Dialog(
          child: Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * .4,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Order placed",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Column(
                    children: [
                      Text(
                        "Price :  ${price.totalTax}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        "Cash :  ${dineIn.cash}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        "Credit :  ${dineIn.credit}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        "Split in Persons :  ${dineIn.splitInPersons}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        "Per Person :  ${dineIn.split}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        "Voucher No. :  ${dineIn.voucher}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        "Notes :  ${dineIn.notes}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        "Payment Method :  ${dineIn.paymentMethod}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                      Text(
                        "Total Discount :  ${dineIn.discount}%",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey),
                      ),
                      Text(
                        "Total Discount Price :  ${dineIn.finalDiscount}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey),
                      ),
                    ],
                  ),

                  TextButton(
                    child: Text('OK'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.blue[300],
                      onSurface: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
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


