import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AddTable extends StatefulWidget {
  const AddTable({ Key? key }) : super(key: key);

  @override
  _AddTableState createState() => _AddTableState();
}

class _AddTableState extends State<AddTable> {


  final _formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'SA';
  PhoneNumber number = PhoneNumber(isoCode: 'SA');
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            " Add Table",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          // foregroundColor: Colors.black,
        ),
        body: Column(children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(

                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Center(
                                  child: Text(
                                    "Table Shape",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top: 12),
                          child: Text(
                            "Floor No",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 2),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top: 12),
                          child: Text(
                            "No of People",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: 2),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top: 12),
                          child: Text(
                            "Color",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 3,
                              height: 50,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 8, top: 12),
                                child: DropdownButton<String>(
                                  hint: Text("Select table Shape"),
                                  //value: "Select one",
                                  items: <String>['Circular', 'Ractengular',].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                )
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                            child: Container(color: Colors.black,
                              width: 2,
                              height: 50,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 8, top: 12),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter floor no",
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
                            width: 2,
                            child: Container(color: Colors.black,
                              width: 2,
                              height: 50,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 8, top: 12),
                                child:  TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Enter No of People",
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
                            width: 2,
                            child: Container(color: Colors.black,
                              width: 2,
                              height: 50,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding:
                                const EdgeInsets.only(left: 8, top: 12),
                                child: DropdownButton<String>(
                                  hint: Text("Select table Color"),
                                  //value: "Select one",
                                  items: <String>['Black', 'Blue',].map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (_) {},
                                ),



                              ),
                            ),

                          ),
                        ],
                      ),
                      SizedBox(height:16),
                      Container(
                        width: 400,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.blue,

                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(child: Text("Add Table",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]));
  }

}