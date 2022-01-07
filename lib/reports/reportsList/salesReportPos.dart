import 'package:flutter/material.dart';

class SalesReportsPos extends StatelessWidget {
  const SalesReportsPos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Container(
        height: 40,
        color: Colors.purple[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                width: MediaQuery.of(context).size.width / 7,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Text(
                        "From",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          ":02/09/2021",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
                width: MediaQuery.of(context).size.width / 7,
                child: Row(
                  children: [
                    Text(
                      "To",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        ":02/09/2021",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
            Container(
                width: MediaQuery.of(context).size.width / 7,
                child: Row(
                  children: [
                    Text(
                      "POS:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "All",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
            Container(
                width: MediaQuery.of(context).size.width / 7,
                child: Text(
                  "filter",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                )),
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
              height: 200,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.black, width: 3)),
              child: Center(
                  child: Text(
                "Sales report \n summary",
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
                    child: Text("From",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
                SizedBox(
                  width: 8,
                ),
                Container(
                    width: 350,
                    // height: 40,
                    child: Text(":2021/09/02",
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
                    child: Text("POS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
                SizedBox(
                  width: 8,
                ),
                Container(
                    width: 350,
                    // height: 40,
                    child: Text("All",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.black, width: 3)),
              child: Padding(
                padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sales summary",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Totle with Tax",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "0.00",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Totle w\o Tax",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "0.00",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tax",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "0.00",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
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
    ]));
  }
}
