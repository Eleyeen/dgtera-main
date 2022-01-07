import 'package:flutter/material.dart';

class ProductVoid extends StatelessWidget {
  const ProductVoid({
    Key? key,
  }) : super(key: key);

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
                  child: Text("All",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(width: 16),
                Text(
                  "From:02/09/2021",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 16,
                ),
                Text("To:02/09/2021",
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
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Center(
                      child: Text(
                    "Product Void",
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
                        child: Text("FROM Date",
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
                        child: Text("TO Date",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                        width: 350,
                        // height: 40,
                        child: Text(":2021-09-02",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25))),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 90,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Divider(
                          color: Colors.black,
                          thickness: 3,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Totle Summary",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "0",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
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
