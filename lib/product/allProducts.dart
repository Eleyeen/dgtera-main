import 'package:dgtera_tablet_app/product/AddProduct.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/cardScreen.dart';
import 'package:dgtera_tablet_app/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreen(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              color: Colors.grey[400],
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                        height: 40,
                        width: 70,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Icon(
                          Icons.home,
                          color: Colors.blue,
                        )),
                    // SizedBox(width: 8,),
                    Container(
                      width: MediaQuery.of(context).size.width /1.5,
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
                    Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(color: Colors.blue),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                        SizedBox(width:16),
                        Expanded(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddProduct()),
                          );
                        },
                        child: Container(
                          // width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(color: Colors.grey),
                          child: Center(
                            child: Text(
                              "Add Product",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    )
                        
    
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                  color: Colors.grey[300],
                  width: MediaQuery.of(context).size.width ,
                  height: MediaQuery.of(context).size.height ,
                  child: GridView.count(
                    mainAxisSpacing: 8,
                    crossAxisCount: 7,
                    children: List.generate(100, (index) {
                  return Card(
                    margin: EdgeInsets.fromLTRB(7, 7, 5, 7),
                    child: InkWell(
                      onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>CardScreen()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AspectRatio(
                            aspectRatio: 18.0 / 11.0,
                            child: Image.asset(
                              'assets/images/google-logo.png',
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
                                    "Google",
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
                                  "Price",
                                  style: TextStyle(
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                  maxLines: 1,
                                ),
                                Spacer(),
                                Text(
                                  "Stock",
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
                  )),
            ),
          ],
        ),
      ),
    );
  }
}