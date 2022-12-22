import 'package:dgtera_tablet_app/DB_Helper/db_helper.dart';
import 'package:dgtera_tablet_app/Models/TaxModel.dart';
import 'package:dgtera_tablet_app/Provider/tax_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class AddTax extends StatefulWidget {
  const AddTax({ Key? key }) : super(key: key);

  @override
  State<AddTax> createState() => _AddTaxState();
}

class _AddTaxState extends State<AddTax> {

  DBHelper dbHelper = DBHelper();

  TextEditingController _taxController = TextEditingController();

  double? taxNum;


  @override
  Widget build(BuildContext context) {
    final tax = Provider.of<TaxProvider>(context, listen: false);
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset:false,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Add Tax",
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
                      onChanged: (val) {
                        _taxController.text = val;
                        taxNum = double.parse(_taxController.text);
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Tax",
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
              GestureDetector(
                onTap: () async {
                  setState(() {
                    tax.setData(taxNum!);
                  });
                  Navigator.pop(context);
                        },
                child: Container(
                  width: 400,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue,

                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(child: Text("Add Tax",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}