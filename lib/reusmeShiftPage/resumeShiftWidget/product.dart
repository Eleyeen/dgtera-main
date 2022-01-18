import 'dart:ffi';

import 'package:dgtera_tablet_app/reusmeShiftPage/modle/shiftItemsModle.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShift.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/cardScreen.dart';
import 'package:dgtera_tablet_app/widgets/global.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<dynamic> images = [
    "assets/images/p1.png", "assets/images/p2.png", "assets/images/p3.png", "assets/images/p4.png", "assets/images/p5.png",
    "assets/images/p6.png", "assets/images/p7.png", "assets/images/p8.png", "assets/images/p9.png", "assets/images/p10.png",
    "assets/images/p1.png", "assets/images/p2.png", "assets/images/p3.png", "assets/images/p4.png", "assets/images/p5.png",
    "assets/images/p6.png", "assets/images/p7.png", "assets/images/p8.png", "assets/images/p9.png", "assets/images/p10.png",
    "assets/images/p1.png", "assets/images/p2.png", "assets/images/p3.png", "assets/images/p4.png", "assets/images/p5.png",
    "assets/images/p6.png", "assets/images/p7.png", "assets/images/p8.png", "assets/images/p9.png", "assets/images/p10.png",
  ];
  List<dynamic> foodnames = [
    "burger", "pasta", "salad", "keer", "chicken", "roti", "halwa", "kabab", "double", "cake",
    "burger", "pasta", "salad", "keer", "chicken", "roti", "halwa", "kabab", "double", "cake",
    "burger", "pasta", "salad", "keer", "chicken", "roti", "halwa", "kabab", "double", "cake",
  ];

  List<double> foodprice = [
    100, 190, 200, 50, 230, 170, 100, 50, 25, 30, 100, 190, 200, 50, 230, 170, 100, 50, 25, 30, 100, 190, 200, 50, 230, 170, 100, 50, 25, 30,
  ];
 List<String> catagory = [ 'Search by Catagory','Food', 'Fruits', 'Halwa', 'Vegitable' , 'Fast food'];
 String _selectedGatagory = 'Search by Catagory';
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            color: Colors.grey[400],
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                 Container(
                   color: Colors.white,
                   height: 40,
                   child: DropdownButton(
            hint: Align(
              alignment: Alignment.centerLeft,
              child: Text('Search by Catagory',style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),),
            ), // Not necessary for Option 1
            value: _selectedGatagory,
            onChanged: (newValue) {
              setState(() {
                _selectedGatagory = newValue.toString();
              });
            },
            items: catagory.map((catagory) {
              return DropdownMenuItem(
                // enabled: true,
                child:  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(catagory),
                ),
                value: catagory,
              );
            }).toList(),
          ),
          ),
 
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Icon(
                        Icons.home,
                        color: Colors.blue,
                      )),
                  // SizedBox(width: 8,),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 600,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          hintText: "Search ",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
  
                  Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
              color: Colors.grey[300],
              width: MediaQuery.of(context).size.width - 470,
              height: MediaQuery.of(context).size.height - 170,
              child: GridView.count(
                mainAxisSpacing: 8,
                crossAxisCount: 5,
                children: List.generate(images.length, (index) {
                  return Card(
                    margin: EdgeInsets.fromLTRB(7, 7, 5, 7),
                    child: InkWell(
                      onTap: () {
                        //add in the list
                        setState(() {
                          selectedItems.add(Item(foodName: foodnames[index],foodPrice: foodprice[index] ,x: 1,note: "",dis: 0,size: "small",totlePrice: foodprice[index] ));
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (builder)=>ResumeScreen()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 18.0 / 11.0,
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.fromLTRB(10.0, 10, 0.0, 0.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    foodnames[index],
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0),
                                    maxLines: 1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.fromLTRB(10.0, 10, 10.0, 0.0),
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  foodprice[index].toString()+"/pcs",
                                  style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                  maxLines: 1,
                                ),
                                Spacer(),
                                Text(
                                  "Stock:2",
                                  style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                }),
              ),
          ),
        ],
      ),
    );
  }
}
