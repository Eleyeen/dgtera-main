import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset:false,
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Add Products",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          // foregroundColor: Colors.black,
        ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                    Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Container(
                            width: MediaQuery.of(context).size.width /2,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(8))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, top: 12),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "Product Name",
                                  focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                              ), 
                                ),
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                          
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2 ,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8, top: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Product Arabic Name",
                              //              enabledBorder: UnderlineInputBorder(      
                              // borderSide: BorderSide(color: Colors.black),   
                              // ),  
                focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                           ),  
                              ),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                         
                          height: 16,
                          ),
                        
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8, top: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Product Discription",
                                focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                         ), 
                              ),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                SizedBox(height:16),
                Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8, top: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Stock",
                                focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                         ), 
                              ),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8, top: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                              hintText: "Product",
                                focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                ), 
                              ),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8, top: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "POS Category Name",
                                focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                         ), 
                              ),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8, top: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Bar Code",
                                focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                         ), 
                              ),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8, top: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Sale Price",
                                focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                         ), 
                              ),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8, top: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "VAT (%)",
                                focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                         ), 
                              ),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8, top: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "Unit of Measure",
                                focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                         ), 
                              ),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8, top: 12),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "On Hand Stock",
                                focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                         ), 
                              ),
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8, top: 12),  
                            child: Row(
                              children: [
                                Text(
                                 "Upload Image",
                                 style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.upload
                                  ),
                                  
                                
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                Container(
                  width: 400,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue,
      
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(child: Text("Add Product",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                )
                      ],
                      
                    ),
                          
                          
              ),
      
      
            ],
          ),
        ),
      ),
    );
  }
}