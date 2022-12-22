import 'dart:convert';

import 'package:dgtera_tablet_app/Models/ShowCustomerModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AddCostomer extends StatefulWidget {
  const AddCostomer({Key? key}) : super(key: key);

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

  String customerName = '';
  String customerAddress = '';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> addCustomer(String name, String phone, String address) async {
    final response = await post(
        Uri.parse("https://api.woga-pos.com/insert_customer.php"),
        body: {
          'name': name,
          'phone': phone,
          'address': address,
        });
    if (response.statusCode == 200) {
      print(response.body);
      print("Customer inserted successfully");
    } else {
      print("Customer not inserted");
    }
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
                              padding: const EdgeInsets.only(left: 8, top: 12),
                              child: TextFormField(
                                onChanged: (name) {
                                  setState(() {
                                    customerName = name;
                                  });
                                },
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
                            child: Container(
                              color: Colors.black,
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
                                  this.number = number;
                                },
                                onInputValidated: (bool value) {
                                  print(value);
                                },
                                selectorConfig: SelectorConfig(
                                  selectorType: PhoneInputSelectorType.DIALOG,
                                ),
                                maxLength: 10,
                                ignoreBlank: true,
                                autoValidateMode: AutovalidateMode.disabled,
                                selectorTextStyle:
                                    TextStyle(color: Colors.black),
                                initialValue: number,
                                textFieldController: controller,
                                formatInput: false,
                                keyboardType: TextInputType.numberWithOptions(
                                    signed: true, decimal: true),
                                // inputBorder: OutlineInputBorder(),
                                onSaved: (PhoneNumber number) {
                                  setState(() {
                                    controller.text = number.toString();
                                  });
                                  print('On Saved: $number');
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2,
                            child: Container(
                              color: Colors.black,
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
                                  onChanged: (address) {
                                    setState(() {
                                      customerAddress = address;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Enter Adress",
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black),
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
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () async {
                          await addCustomer(
                              customerName, number.toString(), customerAddress);

                          Navigator.pop(context, false);
                        },
                        child: Container(
                          width: 400,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                              child: Text(
                            "Add Costumer",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
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
