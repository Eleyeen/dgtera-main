import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class Catogory extends StatefulWidget {
  const Catogory({ Key? key }) : super(key: key);

  @override
  State<Catogory> createState() => _CatogoryState();
}

class _CatogoryState extends State<Catogory> {

  String currentDate = DateTime.now().toString();

  TextEditingController _catController = TextEditingController();

  Future<void> uploadCatagory() async {
    
    var response = await http.post(Uri.parse('https://api.woga-pos.com/insert_categories.php'), body: {
      'name': _catController.text.trim(),
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
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset:false,
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Add Category",
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
                    Column(
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
                                  _catController.text = val;
                                },
                                decoration: InputDecoration(
                                  hintText: "Category Name",
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
                    await uploadCatagory();
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 400,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,

                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(child: Text("Add Category",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                  ),
                )



                      ],

                    ),


            ],
          ),
        ),
      ),
    );
  }
}