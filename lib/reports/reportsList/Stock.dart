import 'package:flutter/material.dart';

class StockReport extends StatelessWidget {
  const StockReport({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Center(
                      child: Text(
                    "Stock Report",
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
                        child: Text("Date",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 350,
                        // height: 40,
                        child: Text(":21-09-2021 05:20AM",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.black54,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search for names...",
                          border: InputBorder.none),
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
