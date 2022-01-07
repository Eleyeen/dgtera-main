import 'package:flutter/material.dart';

class StcPayment extends StatelessWidget {
  const StcPayment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
            child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              child: Row(
                children: [
                  Container(
                      width: 170,
                      child: Text("Ref",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Container(
                        height: 40,
                        width: 440,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Amount",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Time",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "status",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                  ),
                  Container(
                      width: 70,
                      height: 40,
                      decoration: BoxDecoration(color: Colors.purple[50]),
                      child: Center(
                          child: Text("Update",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)))),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
