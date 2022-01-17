import 'package:flutter/material.dart';

class SalesReport extends StatefulWidget {
  const SalesReport({
    Key? key,
  }) : super(key: key);

  @override
  State<SalesReport> createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
  DateTime selectedDate = DateTime.now();
  
  Future<void> selectDate(BuildContext context) async {
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 40,
            color: Colors.purple[50],
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: GestureDetector(
                    onTap: (){
                      selectDate(context);
                    },
                    child: Text("Date:",
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  ("${selectedDate.toLocal()}".split(' ')[0]),
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 16,
                ),
                Text("Shift:",
                    style: TextStyle(
                      fontSize: 20,
                    )),
                SizedBox(
                  width: 16,
                ),
                Text("summary",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  width: 450,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Center(
                      child: Text(
                    "Sales report",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  )),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                        width: 250,
                        // height: 40,
                        child: Text("POS Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 350,
                        // height: 40,
                        child: Text(":POS07",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 250,
                        // height: 40,
                        child: Text("Business day",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 350,
                        // height: 40,
                        child: Text(":02/09/2021",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 250,
                        // height: 40,
                        child: Text("From",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 350,
                        // height: 40,
                        child: Text(":2021-09-02 03:54 AM",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        width: 250,
                        // height: 40,
                        child: Text("To",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 350,
                        // height: 40,
                        child: Text(":",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment summary",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "payment summary",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Type summary",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order Type summary",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Payment - Order Type summary",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Payment - Order Type summary",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                    child: Text(
                  "Powerd by DJTERA",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 64,
                ),
                Center(
                    child: Text(
                  "printed by user111",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                Center(
                    child: Text(
                  "Print at 02-09-2021 05:12AM",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
