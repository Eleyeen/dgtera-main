import 'dart:io';
import 'dart:convert';

import 'package:dgtera_tablet_app/Models/CategoryModelTax.dart';
import 'package:dgtera_tablet_app/Models/CatrgoryModelUnit.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:intl/intl.dart';

import '../Models/CategoryModel.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _arabicNameController = TextEditingController();
  TextEditingController _stockController = TextEditingController();
  TextEditingController _catIdController = TextEditingController();
  TextEditingController _barCodeController = TextEditingController();
  TextEditingController _dinePriceController = TextEditingController();
  TextEditingController _takePriceController = TextEditingController();
  TextEditingController _vatController = TextEditingController();
  TextEditingController _unitController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  File? image;
  final _picker = ImagePicker();
  bool showSpinner = false;
  String? base64Image;
  List<CategoryModel> catList = [];
  List<CategoryModelUnit> catListunit = [];
  List<CategoryModelTax> catListTax = [];

  var data;
  var dataunit;
  var datatax;
  String? included = '';
  String? excluded = '';
  String _selectedCategory = '';
  String _selectedCategoryTax = '';
  String _selectedCategoryUnit = '';

  Future getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      List<int> imageBytes = image?.readAsBytesSync() as List<int>;
      base64Image = base64Encode(imageBytes);

      setState(() {});
    } else {
      print('no Image Selected');
    }
  }

  String currentDate = DateTime.now().toString();

  Future<void> uploadData(context) async {
    setState(() {
      showSpinner = true;
    });

    var stream = new http.ByteStream(image!.openRead());
    stream.cast();

    var length = await image!.length();

    var uri = Uri.parse("https://api.woga-pos.com/insert_product.php");

    var request = new http.MultipartRequest('POST', uri);

    request.fields['name'] = _nameController.text.trim();
    request.fields['arbic_name'] = _arabicNameController.text.trim();
    request.fields['stock_in_hand'] = _stockController.text.trim();
    request.fields['category_id'] = _selectedCategory.toString();
    request.fields['barcode'] = _barCodeController.text.trim();
    request.fields['dineprice'] = _dinePriceController.text.trim();
    request.fields['takeawayprice'] = _takePriceController.text.trim();
    request.fields['vat'] = _selectedCategoryTax.toString();
    ;
    request.fields['img1'] = base64Image.toString();
    request.fields['unitofmeasure'] = _selectedCategoryUnit.toString();
    request.fields['description'] = _descController.text.trim();
    // request.fields['created_at'] = currentDate.toString();
    // request.fields['updated_at'] = currentDate.toString();

    var multipartFile = new http.MultipartFile('img1', stream, length,
        filename: basename(base64Image!));

    request.files.add(multipartFile);

    var response = await request.send();

    var respStr = await response.stream.toBytes();
    var responseJson = String.fromCharCodes(respStr);
    print("the given response is $responseJson");

    // Map<String, dynamic> map = responseJson;
    if (response.statusCode == 200) {
      setState(() {
        showSpinner = false;
      });
      // print(map['id']);
      print('image uploaded successfully');
    } else {
      print('failed');
      setState(() {
        showSpinner = false;
      });
    }
  }

  Future<List<CategoryModel>> getCategories() async {
    final response =
        await get(Uri.parse('https://api.woga-pos.com/show_categories.php'));
    data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      catList.clear();
      for (Map i in data) {
        catList.add(CategoryModel.fromJson(i));
      }
      return catList;
    } else {
      return catList;
    }
  }

  Future<List<CategoryModelUnit>> getCategoriesUnit() async {
    final response =
        await get(Uri.parse('https://api.woga-pos.com/show_unit.php'));
    dataunit = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      catListunit.clear();
      for (Map i in dataunit) {
        catListunit.add(CategoryModelUnit.fromJson(i));
      }
      return catListunit;
    } else {
      return catListunit;
    }
  }

  Future<List<CategoryModelTax>> getCategoriesTax() async {
    final response =
        await get(Uri.parse('https://api.woga-pos.com/show_tax.php'));
    datatax = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      catListTax.clear();
      for (Map i in datatax) {
        catListTax.add(CategoryModelTax.fromJson(i));
      }
      return catListTax;
    } else {
      return catListTax;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, top: 12),
                        child: TextFormField(
                          // controller: _nameController,
                          onChanged: (value) {
                            setState(() {
                              _nameController.text = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Product Name",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 12),
                      child: TextFormField(
                        // controller: _arabicNameController,
                        onChanged: (value) {
                          setState(() {
                            _arabicNameController.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Product Arabic Name",
                          //              enabledBorder: UnderlineInputBorder(
                          // borderSide: BorderSide(color: Colors.black),
                          // ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 12),
                      child: TextFormField(
                        // controller: _descController,
                        onChanged: (value) {
                          setState(() {
                            _descController.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Product Discription",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    color: Colors.white,
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2,
                    child: FutureBuilder(
                        future: getCategories(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Text('Loading');
                          } else {
                            return DropdownButton(
                              hint: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Select Category',
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                              ), // Not necessary for Option 1
                              // value: 'Fruits',
                              // value: _selectedCategory.toString() == ''
                              //     ? 'Search By Category'
                              //     : _selectedCategory,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedCategory = newValue.toString();
                                  print(newValue);
                                  print("sassssssssss" + _selectedCategory);
                                });
                              },
                              items: catList.map((catagory) {
                                return DropdownMenuItem(
                                  enabled: true,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(catagory.name.toString()),
                                  ),
                                  value: catagory.id,
                                );
                              }).toList(),
                            );
                          }
                        }),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width / 2,
                  //   height: 50,
                  //   decoration: BoxDecoration(color: Colors.white),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 8, top: 12),
                  //     child: TextFormField(
                  //       // controller: _catIdController,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           _catIdController.text = value;
                  //         });
                  //       },
                  //       decoration: InputDecoration(
                  //         hintText: "POS Category Name",
                  //         focusedBorder: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.black),
                  //         ),
                  //       ),
                  //       style: TextStyle(fontSize: 20, color: Colors.black),
                  //     ),
                  //   ),
                  // ),

                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 12),
                      child: TextFormField(
                        // controller: _barCodeController,
                        onChanged: (value) {
                          setState(() {
                            _barCodeController.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Bar Code",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 12),
                      child: TextFormField(
                        // controller: _dinePriceController,
                        onChanged: (value) {
                          setState(() {
                            _dinePriceController.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Dine in Price",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 12),
                      child: TextFormField(
                        // controller: _takePriceController,
                        onChanged: (value) {
                          setState(() {
                            _takePriceController.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Take away Price",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  Container(
                    color: Colors.white,
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2,
                    child: FutureBuilder(
                        future: getCategoriesTax(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Text('Loading');
                          } else {
                            return DropdownButton(
                              hint: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "VAT (%)",
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                              ), // Not necessary for Option 1
                              // value: 'Fruits',
                              // value: _selectedCategory.toString() == ''
                              //     ? 'Search By Category'
                              //     : _selectedCategory,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedCategoryTax = newValue.toString();
                                  print(newValue);
                                  print("sassssssssss" + _selectedCategoryTax);
                                });
                              },
                              items: catListTax.map((catagory) {
                                return DropdownMenuItem(
                                  enabled: true,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(catagory.name.toString()),
                                  ),
                                  value: catagory.id,
                                );
                              }).toList(),
                            );
                          }
                        }),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      children: [
                        Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Colors.black),
                            value: 'included',
                            groupValue: excluded,
                            onChanged: (index) {
                              setState(() {
                                excluded = index.toString();

                                print(index);
                              });
                            }),
                        Text(
                          'included',
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Colors.black),
                            value: 'excluded',
                            groupValue: excluded,
                            onChanged: (index) {
                              setState(() {
                                excluded = index.toString();
                                print(index);
                              });
                            }),
                        Text(
                          'excluded',
                        )
                      ],
                    ),
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width / 2,
                  //   height: 50,
                  //   decoration: BoxDecoration(color: Colors.white),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 8, top: 12),
                  //     child: TextFormField(
                  //       // controller: _vatController,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           _vatController.text = value;
                  //         });
                  //       },
                  //       decoration: InputDecoration(
                  //         hintText: "VAT (%)",
                  //         focusedBorder: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.black),
                  //         ),
                  //       ),
                  //       style: TextStyle(fontSize: 20, color: Colors.black),
                  //     ),
                  //   ),
                  // ),

                  SizedBox(
                    height: 16,
                  ),

                  Container(
                    color: Colors.white,
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2,
                    child: FutureBuilder(
                        future: getCategoriesUnit(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Text('Loading');
                          } else {
                            return DropdownButton(
                              hint: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Unit of Measure',
                                  style: TextStyle(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none),
                                ),
                              ), // Not necessary for Option 1
                              // value: 'Fruits',
                              // value: _selectedCategory.toString() == ''
                              //     ? 'Search By Category'
                              //     : _selectedCategory,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedCategoryUnit = newValue.toString();
                                  print(newValue);
                                  print("sassssssssss" + _selectedCategoryUnit);
                                });
                              },
                              items: catListunit.map((catagory) {
                                return DropdownMenuItem(
                                  enabled: true,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(catagory.name.toString()),
                                  ),
                                  value: catagory.id,
                                );
                              }).toList(),
                            );
                          }
                        }),
                  ),

                  // Container(
                  //   width: MediaQuery.of(context).size.width / 2,
                  //   height: 50,
                  //   decoration: BoxDecoration(color: Colors.white),
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(left: 8, top: 12),
                  //     child: TextFormField(
                  //       // controller: _unitController,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           _unitController.text = value;
                  //         });
                  //       },
                  //       decoration: InputDecoration(
                  //         hintText: "Unit of Measure",
                  //         focusedBorder: UnderlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.black),
                  //         ),
                  //       ),
                  //       style: TextStyle(fontSize: 20, color: Colors.black),
                  //     ),
                  //   ),
                  // ),

                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 12),
                      child: TextFormField(
                        // controller: _stockController,
                        onChanged: (value) {
                          setState(() {
                            _stockController.text = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "On Hand Stock",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: image == null
                        ? Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black38),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Upload Image",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Icon(Icons.upload),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 400,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black38),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Image.file(
                                File(image!.path).absolute,
                                height: 300,
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () async {
                      await uploadData(context);
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
                        "Add Product",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )),
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
