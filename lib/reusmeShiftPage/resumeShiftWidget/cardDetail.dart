import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShift.dart';
import 'package:dgtera_tablet_app/reusmeShiftPage/resumeShiftWidget/cardScreen.dart';
import 'package:dgtera_tablet_app/widgets/global.dart';
import 'package:flutter/material.dart';

class CardDetail extends StatefulWidget {
  int? index;
  CardDetail({this.index});
  @override
  _CardDetailState createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return body();
  }
  body(){
    return Container(
      height: 350,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16))
      ),
      child: ListView.builder(
          itemCount: selectedItems.length,
          itemBuilder: (context, index) {
            count++;
            return Card(
              elevation: 0,
              child:
              Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey)
                      ),
                      child: Center(
                        child: Text(
                       ( index+1).toString(),
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,height: 20,),
                    Column(
                      children: [
                        Text(selectedItems[index].foodName.toString(),style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey[600])),
                        Text(selectedItems[index].x.toString()+" "+selectedItems[index].note.toString(),style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.grey[600])),
                      ],
                    ),
                    SizedBox(width: 170,),
                    Column(
                      children: [
                        Text(selectedItems[index].foodPrice.toString(), style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey[600])),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (builder)=>CardScreen(item: selectedItems[index])));
                          },
                          child: Icon(Icons.note_add_rounded,size: 30,),),
                      ],
                    ),
                    SizedBox(width: 15,height: 20,),
                    GestureDetector(
                      onTap: (){
                        showDialog(
                            context: context,
                            builder: (context)=> AlertDialog(
                              title: Text("Delete",style: TextStyle(color: Colors.black),),
                              actions:<Widget>[
                                FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("No",style: TextStyle(color: Colors.black),)),
                                FlatButton(onPressed: (){
                                  setState(() {
                                    selectedItems.removeAt(index);
                                  });
                                  print(index);
                                  selectedItems.forEach((element) {
                                    print(element.foodName);
                                  });
                                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>ResumeScreen()));
                                }, child: Text("Yes",style: TextStyle(color: Colors.black),))
                              ],
                              content: Text("Are you sure you want to delete this Item"),
                            ));
                      },
                      child: Icon(Icons.delete),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

/*ListTile(
leading: Container(
width: 45,
height: 45,
decoration: BoxDecoration(
shape: BoxShape.circle,
border: Border.all(color: Colors.grey)
),
child: Center(
child: Text(
"$count".toString(),
style: TextStyle(
fontSize: 30,
color: Colors.black),
),
),
),
title: Text(selectedItems[index].foodName.toString(),style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 20,
color: Colors.grey[600])),
subtitle: Text(selectedItems[index].x.toString()+" "+selectedItems[index].note.toString(),style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 15,
color: Colors.grey[600])),
trailing: Column(
children: [
Text(selectedItems[index].foodPrice.toString(), style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 20,
color: Colors.grey[600])),
GestureDetector(
onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (builder)=>CardScreen(itemName: selectedItems[index].foodName!,index: index,)));
},
child: Icon(Icons.note_add_rounded,size: 30,),),
Icon(Icons.delete),
],
),
),*/
/*
rowCard(int index){
  return Row(
    children: [
      Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey)
        ),
        child: Center(
          child: Text(
            "$count".toString(),
            style: TextStyle(
                fontSize: 30,
                color: Colors.black),
          ),
        ),
      ),
      Column(
        children: [
          Text(selectedItems[index].foodName.toString(),style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.grey[600])),
          Text(selectedItems[index].x.toString()+" "+selectedItems[index].note.toString(),style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.grey[600])),
        ],
      ),
      Column(
        children: [
          Text(selectedItems[index].foodPrice.toString(), style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.grey[600])),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (builder)=>CardScreen(itemName: selectedItems[index].foodName!,index: index,)));
            },
            child: Icon(Icons.note_add_rounded,size: 30,),),
        ],
      ),
      Icon(Icons.delete),


    ],
  );
}*/
