import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:http/http.dart' as http;

class AddTable extends StatefulWidget {
  const AddTable({ Key? key }) : super(key: key);

  @override
  _AddTableState createState() => _AddTableState();
}

class _AddTableState extends State<AddTable> {


  final _formKey = GlobalKey<FormState>();
  TextEditingController _floorController = TextEditingController();
  TextEditingController _peopleController = TextEditingController();
  String initialCountry = 'SA';
  PhoneNumber number = PhoneNumber(isoCode: 'SA');
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number = number;
    });
  }

  String tableShape = '';
  String tableShapeName = 'Select One';
  String tableColor = '';

  String currentDate = DateTime.now().toString();

  Future<void> addTable() async {

    var response = await http.post(Uri.parse('https://api.woga-pos.com/insert_table.php'), body: {
      'shape': tableShape.toString(),
      'floor': _floorController.text.trim(),
      'people': _peopleController.text.trim(),
      'color': tableColor.toString(),
      'created_at': currentDate.toString(),
      'updated_at': currentDate.toString(),
    });

    if(response.statusCode == 200){
      print("success");
    }
    else{
      print("failed");

    }
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
                                child: DropdownButton(
                                  isExpanded: true,
                                  hint: Text("Select table Shape"),
                                  // value: tableShapeName,
                                  items: ['Circular', 'Rectangular','Square'].map((value) {
                                    return DropdownMenuItem(
                                      value: value.toString(),
                                      child: Text(value.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      tableShape = val.toString();
                                      print(tableShape);
                                    });
                                  },
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
                                  onChanged: (val){
                                    setState(() {
                                      _floorController.text = val;
                                    });
                                  },
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
                                  onChanged: (val){
                                    setState(() {
                                      _peopleController.text = val;
                                    });
                                  },
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
                                  onChanged: (val) {
                                    setState(() {
                                      tableColor = val.toString();
                                    });
                                  },
                                ),



                              ),
                            ),

                          ),
                        ],
                      ),
                      SizedBox(height:16),
                      GestureDetector(
                        onTap: () {
                          addTable();
                          Navigator.pop(context, false);
                        },
                        child: Container(
                          width: 400,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.blue,

                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(child: Text("Add Table",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                        ),
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