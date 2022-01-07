import 'package:dgtera_tablet_app/utilities/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Discount", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey),),
                  Divider(),
                  Text("10 %", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color(0xff2b0042)),),
                  Divider(),
                  Text("20 %", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color(0xff2b0042)),),
                  Divider(),
                  Text("30%", textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color(0xff2b0042)),),
                ],
              ),
            ),
          ),
        );
      },
      context: context,
    );
  }
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Color(0xfffff2f3),
              height: 100,
              width: 100,
              padding: EdgeInsets.fromLTRB(70, 60, 20, 10),
              child: Text(
                "Woga",
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.resumeRoute);
              },
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.creditcard,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "RESUME Shift",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.grey[600], fontSize: 20),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.dashboredRoute);
              },
              child: Container(
                color: Colors.grey.shade400,
                child: ListTile(
                    leading: Icon(
                      CupertinoIcons.creditcard,
                      color: Colors.grey,
                    ),
                    title: Text(
                      "Dashbored",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.grey[600], fontSize: 20),
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.history);
              },
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.timer,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "History",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.grey[600], fontSize: 20),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.reports);
              },
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.doc_richtext,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Report",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.grey[600], fontSize: 20),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.zreports);
              },
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.doc_richtext,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Z Report",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.grey[600], fontSize: 20),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.product);
              },
              child: ListTile(
                  leading: Icon(
                    Icons.production_quantity_limits,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Product",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.grey[600], fontSize: 20),
                  )),
            ),
            GestureDetector(
              onTap: () {
               dialog();
              },
              child: ListTile(
                  leading: Icon(
                    Icons.production_quantity_limits,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Discount",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.grey[600], fontSize: 20),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.history);
              },
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.timer,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Sales Return",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.grey[600], fontSize: 20),
                  )),
            ),

            Container(
              color: Color(0xfffff1f1),
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.news,
                    color: Color(0xfffff2f3),
                  ),
                  title: Text(
                    "Sitting",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              color: Colors.grey[400],
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.settings_solid,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Setting",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.settings,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Upload Database",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              color: Colors.grey[400],
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.news,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Printer Log",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              color: Colors.grey[400],
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.news,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Inginco Log",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              color: Color(0xfffff2f3),
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.news,
                    color: Color(0xfffff2f3),
                  ),
                  title: Text(
                    "User",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.password);
              },
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.keyboard,
                    color: Colors.grey,
                  ),
                  title: Text(
                    "Change Pin Code",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.grey[600], fontSize: 20),
                  )),
            ),
            ListTile(
                leading: Icon(
                  CupertinoIcons.lock,
                  color: Colors.grey,
                ),
                title: Text(
                  "Lock Screen",
                  textScaleFactor: 1.2,
                  style: TextStyle(color: Colors.grey[600], fontSize: 20),
                )),
            Container(
              color: Color(0xfffff2f3),
              child: ListTile(
                  leading: Icon(
                    CupertinoIcons.news,
                    color: Color(0xfffff2f3),
                  ),
                  title: Text(
                    "Language",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            ListTile(
                leading: Icon(
                  CupertinoIcons.news,
                  color: Colors.white,
                ),
                title: Text(
                  "العربیہ",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
