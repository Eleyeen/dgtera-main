import 'package:flutter/material.dart';

class Void extends StatelessWidget {
  const Void({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: Center(
                child: Text(
              "Order[2]",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black
              ),
            ))),
            // SizedBox(height: 8,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color:Colors.grey,width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white
            ),
              // color: Colors.white,
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8 ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Text("ID",style: TextStyle(
                
                fontSize: 20,
                color: Colors.grey
              ),), Text("2",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey
              ),)],
                        ),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 2,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text("Title",
                      style: TextStyle(
                
                fontSize: 20,
                color: Colors.grey
              ),), Text("Table [4]",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey
              ),)],
                    ),
                  ),
                  VerticalDivider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 2,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        
                        children: [Text("Order",style: TextStyle(
                
                fontSize: 20,
                color: Colors.grey
              ),), Text("PO7-2",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey
              ),)],
                      ),
                    ),
                  ),
                  VerticalDivider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 2,
                  ),
                  Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [Text("Time",style: TextStyle(
                
                fontSize: 20,
                color: Colors.grey
              ),), Text("05:31 AM",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey
              ),)],
                        ),
                      )),
                  VerticalDivider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 2,
                  ),
                  Expanded(
                      flex: 5,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [Text("Totle",style: TextStyle(
                
                fontSize: 20,
                color: Colors.grey
              ),), Text("100",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey
              ),)],
                          ),
                        ),
                      ))
                ],
              )),
        ),
        Container()
      ],
    );
  }
}