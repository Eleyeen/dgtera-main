import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/table.dart';
import 'package:flutter/material.dart';

class DateAndTime extends StatelessWidget {
  const DateAndTime({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          )),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(right:16),
              child: TextButton.icon(onPressed: (){
                        
              }, icon: Icon(Icons.cancel,color: Colors.black,), label: Text("Clear list",style: TextStyle(color: Colors.black),)),
            ),
            
            Padding(
              padding: const EdgeInsets.only(right:16),
              child: TextButton.icon(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>TableWidget()));
              }, icon: Icon(Icons.sync,color: Colors.black,), label: Text("Switch Table",style: TextStyle(color: Colors.black),)),
            )
            // Row(
            //   children: [
            //     IconButton(icon: Icon(Icons.sync), onPressed: () { 
            //         Navigator.push(context, MaterialPageRoute(builder: (builder)=>TableWidget()));
            //      },
                  
                  
            //     ),
            //      Padding(
            //        padding: const EdgeInsets.only(right: 8),
            //        child: Text("Switch Table"),
            //      )
            //   ],
            // ),
           
          ],
        ),
      ),
    );
  
  }
}
