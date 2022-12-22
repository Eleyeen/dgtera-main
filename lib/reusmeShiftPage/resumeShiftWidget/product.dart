import 'dart:convert';

import 'package:dgtera_tablet_app/Models/CatProductModel.dart';
import 'package:dgtera_tablet_app/Models/CategoryModel.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/modle/shiftItemsModle.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShift.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/cardDetail.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/cardScreen.dart';
import 'package:dgtera_tablet_app/widgets/global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<CatProductModel> allProductList = [];

  var data2;
  List<CategoryModel> catList = [];

  var data;

  List<CatProductModel> catProductList = [];

  var data1;
  String _selectedCategory = '';

  List<dynamic> items = [];
  List<dynamic> itemsAll = [];
  bool showList = true;
  bool showListAll = true;

  TextEditingController editingController = TextEditingController();

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

  Future<List<CatProductModel>> getAllProducts() async {
    // final response =
    //     await get(Uri.parse('https://api.woga-pos.com/show_products.php'));
    final response = await get(Uri.parse(
        'https://api.woga-pos.com/show_product_individual.php?category_id=3'));
    data2 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      allProductList.clear();
      for (Map i in data2) {
        allProductList.add(CatProductModel.fromJson(i));
      }
      return allProductList;
    } else {
      return allProductList;
    }
  }

  Future<List<CatProductModel>> getProductsByCat() async {
    // final response = await get(Uri.parse(
    //     'https://api.woga-pos.com/show_product_individual.php?category_id=3'));
    final response =
        await get(Uri.parse('https://api.woga-pos.com/show_products.php'));
    data1 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      catProductList.clear();
      for (Map i in data1) {
        catProductList.add(CatProductModel.fromJson(i));
      }
      return catProductList;
    } else {
      return catProductList;
    }
  }

  @override
  void initState() {
    setState(() {
      getProductsByCat();
      items.addAll(catProductList);
      itemsAll.addAll(allProductList);
    });
    super.initState();
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${items}");
    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${catProductList.length}");

    _selectedCategory = 'all';
  }

  void filterSearchResultsAll(String query) {
    List<dynamic> dummySearchList = [];
    dummySearchList.addAll(allProductList.map((e) => e.name.toString()));
    if (query.isNotEmpty) {
      List<dynamic> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        itemsAll.clear();
        itemsAll.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        itemsAll.clear();
        itemsAll.addAll(allProductList);
      });
    }
  }

  void filterSearchResults(String query) {
    List<dynamic> dummySearchList = [];
    dummySearchList.addAll(catProductList.map((e) => e.name.toString()));
    if (query.isNotEmpty) {
      List<dynamic> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(catProductList);
      });
    }
  }

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  Future<bool?> _showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Please confirm'),
      content: const Text('Do you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Padding(
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
                      width: MediaQuery.of(context).size.width * .20,
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
                                    'Search by Category',
                                    style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.none),
                                  ),
                                ), // Not necessary for Option 1
                                // value: 'Fruits',
                                // value: _selectedCategory == 'all'
                                //     ? 'Fruits'
                                //     : _selectedCategory,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedCategory = newValue.toString();
                                    print(newValue);
                                    print("sassssssssss" + _selectedCategory);
                                    print('lengggggg${catProductList.length}');
                                    print(
                                        'lengggggppppppppppppppppppppppppppg${allProductList.length}');
                                  });
                                },
                                items: catList.map((catagory) {
                                  return DropdownMenuItem(
                                    enabled: true,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(catagory.id.toString()),
                                    ),
                                    value: catagory.id,
                                  );
                                }).toList(),
                              );
                            }
                          }),
                    ),

                    /* Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Icon(
                          Icons.home,
                          color: Colors.blue,
                        )),*/
                    // SizedBox(width: 8,),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 600,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: TextField(
                          onChanged: (value) {
                            if (_selectedCategory == 'all') {
                              filterSearchResultsAll(value);
                              setState(() {
                                print(itemsAll);
                                if (value.length > 0) {
                                  showListAll = false;
                                } else {
                                  showListAll = true;
                                }
                              });
                            } else {
                              filterSearchResults(value);
                              setState(() {
                                print(items);
                                if (value.length > 0) {
                                  showList = false;
                                } else {
                                  showList = true;
                                }
                              });
                            }
                          },
                          controller: editingController,
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
            _selectedCategory == 'all'
                ? showListAll
                    ? Expanded(
                        child: FutureBuilder(
                            future: getAllProducts(),
                            builder: (context, snapshot) {
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5),
                                shrinkWrap: true,
                                itemCount: allProductList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: EdgeInsets.fromLTRB(7, 7, 5, 7),
                                    child: InkWell(
                                      onTap: () {
                                        print(allProductList[index]
                                            .dineprice
                                            .toString());
                                        //add in the list
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    CardScreen(
                                                      catProductModel:
                                                          allProductList[index],
                                                      index: index,
                                                    )));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          AspectRatio(
                                            aspectRatio: 18.0 / 11.0,
                                            child: Image.network(
                                              'https://woga-pos.com/uploads/products/${allProductList[index].image.toString()}',
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 10, 0.0, 0.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Center(
                                                  child: Text(
                                                    allProductList[index]
                                                        .name
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily: 'Raleway',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.0),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 10, 10.0, 0.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  allProductList[index]
                                                          .dineprice
                                                          .toString() +
                                                      "/pcs",
                                                  style: TextStyle(
                                                      fontFamily: 'Raleway',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0),
                                                  maxLines: 1,
                                                ),
                                                Spacer(),
                                                Text(
                                                  "Stock : ${allProductList[index].stockInHand.toString()}",
                                                  style: TextStyle(
                                                      fontFamily: 'Raleway',
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                },
                              );
                            }))
                    : Expanded(
                        child: FutureBuilder(
                            future: getAllProducts(),
                            builder: (context, snapshot) {
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5),
                                shrinkWrap: true,
                                itemCount: itemsAll.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: EdgeInsets.fromLTRB(7, 7, 5, 7),
                                    child: InkWell(
                                      onTap: () {
                                        //add in the list
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    CardScreen(
                                                      catProductModel:
                                                          allProductList[index],
                                                      index: index,
                                                    )));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          AspectRatio(
                                            aspectRatio: 18.0 / 11.0,
                                            child: Image.network(
                                              "https://woga-pos.com/uploads/products/${allProductList[index].image.toString()}",
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 10, 0.0, 0.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Center(
                                                  child: Text(
                                                    itemsAll[index].toString(),
                                                    style: TextStyle(
                                                        fontFamily: 'Raleway',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.0),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 10, 10.0, 0.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  allProductList[index]
                                                          .dineprice
                                                          .toString() +
                                                      "/pcs",
                                                  style: TextStyle(
                                                      fontFamily: 'Raleway',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0),
                                                  maxLines: 1,
                                                ),
                                                Spacer(),
                                                Text(
                                                  "Stock : ${allProductList[index].stockInHand.toString()}",
                                                  style: TextStyle(
                                                      fontFamily: 'Raleway',
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                },
                              );
                            }))
                : showList
                    ? Expanded(
                        child: FutureBuilder(
                            future: getProductsByCat(),
                            builder: (context, snapshot) {
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5),
                                shrinkWrap: true,
                                itemCount: catProductList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: EdgeInsets.fromLTRB(7, 7, 5, 7),
                                    child: InkWell(
                                      onTap: () {
                                        //add in the list
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    CardScreen(
                                                      catProductModel:
                                                          catProductList[index],
                                                      index: index,
                                                    )));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          AspectRatio(
                                            aspectRatio: 18.0 / 11.0,
                                            child: Image.network(
                                              "https://woga-pos.com/uploads/products/${catProductList[index].image.toString()}",
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 10, 0.0, 0.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Center(
                                                  child: Text(
                                                    catProductList[index]
                                                        .name
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily: 'Raleway',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.0),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 10, 10.0, 0.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  catProductList[index]
                                                          .dineprice
                                                          .toString() +
                                                      "/pcs",
                                                  style: TextStyle(
                                                      fontFamily: 'Raleway',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0),
                                                  maxLines: 1,
                                                ),
                                                Spacer(),
                                                Text(
                                                  "Stock : ${catProductList[index].stockInHand.toString()}",
                                                  style: TextStyle(
                                                      fontFamily: 'Raleway',
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                },
                              );
                            }))
                    : Expanded(
                        child: FutureBuilder(
                            future: getProductsByCat(),
                            builder: (context, snapshot) {
                              return GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5),
                                shrinkWrap: true,
                                itemCount: catProductList.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: EdgeInsets.fromLTRB(7, 7, 5, 7),
                                    child: InkWell(
                                      onTap: () {
                                        //add in the list
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    CardScreen(
                                                      catProductModel:
                                                          catProductList[index],
                                                      index: index,
                                                    )));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          AspectRatio(
                                            aspectRatio: 18.0 / 11.0,
                                            child: Image.network(
                                              "https://woga-pos.com/uploads/products/${catProductList[index].image.toString()}",
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 10, 0.0, 0.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Center(
                                                  child: Text(
                                                    catProductList[index]
                                                        .name
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily: 'Raleway',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.0),
                                                    maxLines: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10.0, 10, 10.0, 0.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  catProductList[index]
                                                          .dineprice
                                                          .toString() +
                                                      "/pcs",
                                                  style: TextStyle(
                                                      fontFamily: 'Raleway',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0),
                                                  maxLines: 1,
                                                ),
                                                Spacer(),
                                                Text(
                                                  "Stock : ${catProductList[index].stockInHand.toString()}",
                                                  style: TextStyle(
                                                      fontFamily: 'Raleway',
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                },
                              );
                            }))

            //  Expanded(
            //     child: GridView.builder(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 5),
            //     shrinkWrap: true,
            //     itemCount: items.length,
            //     itemBuilder: (context, index) {
            //       return Card(
            //         margin: EdgeInsets.fromLTRB(7, 7, 5, 7),
            //         child: InkWell(
            //           onTap: () {
            //             //add in the list
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (builder) => CardScreen(
            //                           catProductModel:
            //                               catProductList[index],
            //                           index: index,
            //                         )));
            //           },
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               AspectRatio(
            //                 aspectRatio: 18.0 / 11.0,
            //                 child: Image.network(
            //                   catProductList[index].image.toString(),
            //                   fit: BoxFit.scaleDown,
            //                 ),
            //               ),
            //               Padding(
            //                 padding:
            //                     EdgeInsets.fromLTRB(10.0, 10, 0.0, 0.0),
            //                 child: Column(
            //                   crossAxisAlignment:
            //                       CrossAxisAlignment.start,
            //                   children: <Widget>[
            //                     Center(
            //                       child: Text(
            //                         items[index].toString(),
            //                         style: TextStyle(
            //                             fontFamily: 'Raleway',
            //                             fontWeight: FontWeight.bold,
            //                             fontSize: 14.0),
            //                         maxLines: 1,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Padding(
            //                 padding: EdgeInsets.fromLTRB(
            //                     10.0, 10, 10.0, 0.0),
            //                 child: Row(
            //                   crossAxisAlignment:
            //                       CrossAxisAlignment.start,
            //                   children: <Widget>[
            //                     Text(
            //                       catProductList[index]
            //                               .dineprice
            //                               .toString() +
            //                           "/pcs",
            //                       style: TextStyle(
            //                           fontFamily: 'Raleway',
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 14.0),
            //                       maxLines: 1,
            //                     ),
            //                     Spacer(),
            //                     Text(
            //                       "Stock : ${catProductList[index].stockInHand.toString()}",
            //                       style: TextStyle(
            //                           fontFamily: 'Raleway',
            //                           fontWeight: FontWeight.bold,
            //                           fontSize: 14.0),
            //                       maxLines: 1,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ))
          ],
        ),
      ),
    );
  }
}
