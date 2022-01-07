import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AddCostomer extends StatefulWidget {
  const AddCostomer({ Key? key }) : super(key: key);

  @override
  _AddCostomerState createState() => _AddCostomerState();
}

class _AddCostomerState extends State<AddCostomer> {


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
            " Add Customers",
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
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 40,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                "Customer Name",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 50,
                      decoration: BoxDecoration(color: Colors.grey),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, top: 12),
                        child: Text(
                          "Phone",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, top: 12),
                          child: Text(
                            "Address",
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
                                
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: 50,
                                  decoration: BoxDecoration(color: Colors.white),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 12),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Enter Name",
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
                                  width: 2,
                                  child: Container(color: Colors.black,
                                  width: 2,
                                  height: 50,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height: 50,
                                  decoration: BoxDecoration(color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                print(value);
              },
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              maxLength: 10,
              ignoreBlank: true,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: TextStyle(color: Colors.black),
              initialValue: number,
              textFieldController: controller,
              formatInput: false,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              // inputBorder: OutlineInputBorder(),
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
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
                                          hintText: "Enter Adress",
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
                child: Center(child: Text("Add Costumer",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
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