import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/customer.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/table.dart';
import 'package:flutter/material.dart';
class CustomerTable extends StatelessWidget {
  const CustomerTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Customer()));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.all(Radius.circular(8))),
            width: 210,
            height: 45,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_rounded),
                  SizedBox(width: 8),
                  Text("Customer"),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder)=>TableWidget()));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            width: 210,
            height: 45,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.table_chart),
                  SizedBox(width: 8),
                  Text("Table"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
 
  }
}
