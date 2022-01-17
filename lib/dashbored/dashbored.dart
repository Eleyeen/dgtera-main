import 'package:dgtera_tablet_app/pages/login.dart';
import 'package:dgtera_tablet_app/utilities/routes.dart';
import 'package:dgtera_tablet_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class DashboredScreen extends StatefulWidget {
  // const DashboredScreen({Key? key}) : super(key: key);
  @override
  State<DashboredScreen> createState() => _DashboredScreenState();
}

class _DashboredScreenState extends State<DashboredScreen> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  final List<String> operators = ["shahab" , "ahmad" , "Waleed" , "fazal" , " amjid" , "kamran" ,"danyal","shahab" , "ahmad" , "Waleed" , "fazal" , " amjid" , "kamran" ,"danyal"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // handle the press
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
                  Column(
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
                              'User111',
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
                          Text(
                            "21 Sep 2021",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, MyRoutes.resumeRoute);
                                },
                                child: Container(
                                  width: 250,
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
                                  Navigator.pushReplacementNamed(context, '/');
                                },
                                child: Container(
                                  width: 250,
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
                                          color: Colors.grey, fontSize: 25))),
                            ),
                          ),
                        ],
                      )
                    ],
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
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Container(
                         width: MediaQuery.of(context).size.width/8,
                         
                            child: Text(
                              "Operators",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        Container(
                          width: MediaQuery.of(context).size.width/6,
                         
                            child: Text(
                              "In Time",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                        Expanded(
                          // width: MediaQuery.of(context).size.width/4,
                            child: Text(
                              "Out Time",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                  )),

              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: operators.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  // decoration: BoxDecoration(color: Colors.grey)
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         width: MediaQuery.of(context).size.width/8,
                            child: Text(
                              operators[index],
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )),
                     ),
                      Container(
                        width: MediaQuery.of(context).size.width/6,
                          child: Text(
                            TimeOfDay.now().toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                      Expanded(
                          child: Text(
                            TimeOfDay.now().toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                    ],
                  ));

                    }),
              ),
            ],
          ))
        ],
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
