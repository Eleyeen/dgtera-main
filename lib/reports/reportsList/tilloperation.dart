import 'package:flutter/material.dart';

class TillOperation extends StatelessWidget {
  const TillOperation({
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
                  child: Text(
                    "Name",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )),
            Container(
                width: MediaQuery.of(context).size.width / 7,
                child: Text(
                  "Session status",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Container(
                width: MediaQuery.of(context).size.width / 7,
                child: Text(
                  "Time",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Container(
                width: MediaQuery.of(context).size.width / 7,
                child: Text(
                  "Totle",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          ],
        ),
      )
    ]));
  }
}
