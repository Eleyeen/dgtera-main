import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShift.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/table.dart';
import 'package:dgtera_tablet_app/widgets/global.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DateAndTime extends StatefulWidget {
  String? tableId;
  String? floorNum;
  DateAndTime({Key? key, this.floorNum, this.tableId});

  @override
  State<DateAndTime> createState() => _DateAndTimeState();
}

class _DateAndTimeState extends State<DateAndTime> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        sharedd();
      },
    );
  }

  String? tableid;
  String? tablenum;

  void sharedd() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      tableid = prefs.getString('tableid');
      tablenum = prefs.getString('tablenum');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: TextButton.icon(
                    onPressed: () {
                      setState(() {
                        selectedItems.clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => ResumeScreen()));
                      });
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Clear list",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => TableWidget()));
                    },
                    icon: Icon(
                      Icons.sync,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Switch Table",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.table_bar),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => TableWidget()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Text(
                        " Table :  ${tableid.toString()} \n Floor :  ${tablenum.toString()}"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
