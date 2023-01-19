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
  @override
  void initState() {
    super.initState();
  }

  double? getpricedetails() {
    double totalprice = 0;
    selectedItems.forEach((element) {
      setState(() {
        totalprice = (totalprice + (element.discount!));
      });
    });
    return totalprice;
  }

  String _selectedCategory = '';

  // List a = ['a','b','c','d'];

  @override
  Widget build(BuildContext context) {
    final tax = Provider.of<TaxProvider>(context, listen: false);
    print(tax);

    num? totalitems = selectedItems.length;
    double? totalprice = getpricedetails();
    double totalPriceTax = 0.0;
    double finalPrice = 0.0;
    if (tax.tax == null) {
      setState(() {
        tax.setData(0.0);
      });
    }

    void totalitem() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('totalitem', totalitems.toString());
    }

    if (tax.tax != 0.0) {
      setState(() {
        totalPriceTax = totalprice! / tax.tax!;
        finalPrice = totalPriceTax + totalprice;

        tax.setTax(finalPrice);
      });
    }

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
                    Text("Total ($totalitems items)",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey[600])),
                    Spacer(),
                    Text("$totalprice",
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
