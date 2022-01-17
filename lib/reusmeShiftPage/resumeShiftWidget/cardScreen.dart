
import 'package:dgtera_tablet_app/reusmeShiftPage/modle/shiftItemsModle.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShift.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/cardDetail.dart';

import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/customerTable.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/dateAndTime.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/payButton.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/payNow.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/totleDetail.dart';
import 'package:dgtera_tablet_app/widgets/appbar.dart';
import 'package:dgtera_tablet_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {

  Item? item;

  CardScreen({this.item});
  @override
  _CardScreenState createState() => _CardScreenState();
}
String itemIncrement = "";
class _CardScreenState extends State<CardScreen> {
  int itemcount=1;
  String? itmname;
  String? size;

  Widget appBarTitle = Text(
    "My Properties",
    style: TextStyle(color: Colors.white),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.orange,
  );
  TextEditingController noteController = TextEditingController();
  TextEditingController discountController = TextEditingController();


  @override
  void initState() {
    getItemInfo();
    super.initState();
  }
  getItemInfo(){
    itmname = widget.item!.foodName!;
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
                  Row(children: [
                     discountField(),
                  doneButton(),
                  ],)
                 
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
  sizeboxx(){
    return SizedBox(
      height: 2,
    );
  }
  countItem(){
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: Color(0xff2c0c42),
                    borderRadius:
                    BorderRadius.all(Radius.circular(4))),
                child: Center(
                  child: Text(
                    "Void",
                    style: TextStyle(color: Colors.white),
                  ),
                )
            ),
            // SizedBox(width: 8,),
            Padding(
              padding:
              const EdgeInsets.only(left: 16, right: 16),
              child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Text(
                        "$itmname".toUpperCase(),
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
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[600]))),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  itemcount==1? print("not decrementing anymore"):
                  itemcount=itemcount-1;
                });
              },
              child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:Center(
                      child:Text(
                        "-",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white
                        ) ,))
              ),
            ),

            Container(
              height: 40,
              width: 70,
              child: Center(
                  child: Text(
                    "$itemcount",
                    style: TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  )),
            ),
            GestureDetector(
              onTap: (){
                setState(() {
                  itemcount=itemcount+1;

                });
              },
              child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:Center(
                      child:Text(
                        "+",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white
                        ) ,))
              ),
            ),
            SizedBox(
              width: 80,
            ),
            Expanded(
              child: Container(
                width: 100,
                height: 40,
                // ignore: deprecated_member_use
                child: RaisedButton(
                    onPressed: () {}, child: Text("New")),
              ),
            ),
          ],
        ),
      ),
    );
  }
  sizeItem(){
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 100,
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
            Row(
              children: [
                GestureDetector(
                  onTap:(){
                    setState(() {
                      size = "large";
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: 40,
                    color: Colors.grey[600],
                    child: Center(
                        child: Text("Large + (2 SAR)",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17))),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap:(){
                    setState(() {
                      size = "small";
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    height: 40,
                    color: Colors.grey[200],
                    child: Center(
                        child: Text("Small",
                            style: TextStyle(fontSize: 17))),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  clearNote(){
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
                      style: TextStyle(
                          color: Colors.black, fontSize: 17))),
              Spacer(),
              Center(
                  child: Text("Clear notes",
                      style: TextStyle(
                          fontSize: 17, color: Colors.blue))),
            ],
          ),
        )
    );
  }
  extraSugar(){
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width:
                    MediaQuery.of(context).size.width / 5,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: "Extra Suger",
                            border: InputBorder.none),
                      ),
                    )
                ),
                SizedBox(
                  width: 14,
                ),
                Container(
                    width:
                    MediaQuery.of(context).size.width / 5,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: "Extra Suger",
                            border: InputBorder.none),
                      ),
                    )),
                SizedBox(
                  width: 14,
                ),
                Container(
                    width:
                    MediaQuery.of(context).size.width / 5,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: "Extra Suger",
                            border: InputBorder.none),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width:
                    MediaQuery.of(context).size.width / 5,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: "Extra Suger",
                            border: InputBorder.none),
                      ),
                    )
                ),
                SizedBox(
                  width: 14,
                ),
                Container(
                    width:
                    MediaQuery.of(context).size.width / 5,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: "Extra Suger",
                            border: InputBorder.none),
                      ),
                    )),
                SizedBox(width: 14),
                Container(
                    width:
                    MediaQuery.of(context).size.width / 5,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                            hintText: "Extra Suger",
                            border: InputBorder.none),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: noteController,
                  maxLength: null,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                      hintText: "> 1-No Suger",
                      border: InputBorder.none),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  discountField(){
    return Expanded(
      // flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Discount",
                  style: TextStyle(
                      color: Colors.black, fontSize: 17)),
            ),
            // SizedBox(height:10),
            Container(
                height: 60,
                width: 400,
                color: Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
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
  doneButton(){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 45, 0, 8),
        child: GestureDetector(
          onTap: (){
            String note = noteController.text;
            double? dis =double.parse(discountController.text) ;
            widget.item!.size= size;
            widget.item!.note= note;
            widget.item!.dis= dis;
            double? price = widget.item!.foodPrice ;
            // if(itemcount )
            //adjusting price
            if(itemcount > 1){
              widget.item!.totlePrice = ((price! * itemcount) );
            }
            if(dis>0 || dis == 0 ){
              double disPrice = (price! * dis)/100;
              double finalPriceWithDiscount = price - disPrice;
              widget.item!.foodPrice = finalPriceWithDiscount;
            }
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>ResumeScreen()));
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
                  Text("Order type catogory", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                  Divider(),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PayNowScreen()));
                    },
                    child: Text("Dine in", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff2b0042)),)),
                  Divider(),

                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PayNowScreen()));
                      },
                      child: Text("Take Away", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color(0xff2b0042)),)),
                  
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

