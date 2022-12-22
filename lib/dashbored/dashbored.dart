import 'dart:convert';

import 'package:dgtera_tablet_app/Models/UserLogModel.dart';
import 'package:dgtera_tablet_app/Provider/UserLogProvider.dart';
import 'package:flutter/material.dart';

import 'package:dgtera_tablet_app/utilities/routes.dart';
import 'package:dgtera_tablet_app/widgets/drawer.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DashboredScreen extends StatefulWidget {
  DashboredScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<DashboredScreen> createState() => _DashboredScreenState();
}

class _DashboredScreenState extends State<DashboredScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  List<UserLogModel> usersLogList = [];

  var data;
  Future<List<UserLogModel>> getUserLog() async {
    final response =
        await get(Uri.parse('https://api.woga-pos.com/show_userslog.php'));
    data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      usersLogList.clear();
      for (Map i in data) {
        usersLogList.add(UserLogModel.fromJson(i));
      }
      return usersLogList;
    } else {
      return usersLogList;
    }
  }

  Future<void> userLogout(String userId, String username) async {
    final response = await post(
        Uri.parse(
          "https://api.woga-pos.com/insert_userslogouttime.php",
        ),
        body: {
          'user_id': userId,
          'username': username,
          'logouttime': DateFormat.Hm().format(DateTime.now()).toString(),
        });

    if (response.statusCode == 200) {
      print(response.body);

      print("UserLog inserted successfully");
    } else {
      print("UserLog not inserted");
    }
  }

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  Future<bool?> _showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Please confirm'),
      content: const Text('Do you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getUserLog();
    });
  }

  @override
  Widget build(BuildContext context) {
    var userLog = Provider.of<UserLogProvider>(context, listen: false);
    setState(() {
      getUserLog();

      print("Current User name is ${userLog.name}");
      print("Current User name is ${userLog.id}");
      print('jjjjjjjjjjjjjjjjjjjjjjjjdeshboredd${usersLogList.length}');
    });

    setState(() {});

    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        key: _drawerKey,
        drawer: MyDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.sync,
                color: Colors.grey,
              ),
              tooltip: 'notification off',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboredScreen()));
                // handle the press
                print('testttt');
              },
            ),
          ],
          // title: Text("Woga", style:TextStyle(color: Colors.blue)),
          title: Image.asset(
            "assets/images/woga.jpg",
            height: 50,
            // width: 60,
            fit: BoxFit.cover,
            scale: 1,
          ),
          centerTitle: true,
          // shape: CustomShapeBorder(),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: Row(
          children: [
            Container(
              color: Colors.white,
              //            height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width * .55,
              child: Stack(
                  // clipBehavior: Clip.hardEdge,
                  children: [
                    CustomPaint(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                      ),
                      painter: HeaderCurvedContainer(),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            height: 80,
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("assets/images/woga.jpg"),
                                fit: BoxFit.fill,
                                scale: 1,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 44,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  userLog.name,
                                  style: TextStyle(
                                    fontSize: 35.0,
                                    letterSpacing: 1.5,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Text(
                                "Last login",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                child: FutureBuilder(
                                    future: getUserLog(),
                                    builder: (context, snapshot) {
                                      return usersLogList[
                                                  usersLogList.length - 1]
                                              .logintime
                                              .toString()
                                              .isEmpty
                                          ? Text(
                                              "loading..",
                                              style: TextStyle(fontSize: 19),
                                            )
                                          : Text(
                                              usersLogList[
                                                      usersLogList.length - 1]
                                                  .logintime
                                                  .toString(),
                                              style: TextStyle(fontSize: 19),
                                            );
                                    }),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, MyRoutes.resumeRoute);
                                      },
                                      child: Container(
                                        // width: 250,
                                        height: 80,
                                        child: Center(
                                            child: Text("New sesion",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 25))),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, MyRoutes.resumeRoute);
                                      },
                                      child: Container(
                                        // width: 250,
                                        height: 80,
                                        child: Center(
                                            child: Text("Resume sesion",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 25))),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        userLogout(userLog.id, userLog.name);
                                        Navigator.pushReplacementNamed(
                                            context, '/');
                                      },
                                      child: Container(
                                        // width: 250,
                                        height: 80,
                                        child: Center(
                                            child: Text("End session",
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 25))),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  _drawerKey.currentState!.openDrawer();
                                },
                                child: Container(
                                  width: 250,
                                  height: 80,
                                  child: Center(
                                      child: Text("Open Drawer",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 25))),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
            Expanded(
                child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "OPERATIONS",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.grey),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Operators",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "In Time",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "Out Time",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    child: FutureBuilder(
                        future: getUserLog(),
                        builder: (context, snapshot) {
                          return ListView.separated(
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              itemCount: usersLogList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 50,
                                    // decoration: BoxDecoration(color: Colors.grey)
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              usersLogList[index]
                                                  .logintime
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                usersLogList[index]
                                                    .username
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                usersLogList[index]
                                                    .logouttime
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ));
                              });
                        }))
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.blue;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 250.0, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
