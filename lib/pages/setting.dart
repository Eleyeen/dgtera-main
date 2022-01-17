import 'package:flutter/material.dart';

class Setting extends StatelessWidget {

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _oldPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
         appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Setting",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
      ),
        body: SingleChildScrollView(          
          child: Container(
            height: MediaQuery.of(context).size.height - 50,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal:400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                              Container(
                        width: 200,
                        height: 90,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/images/woga.jpg"),
                            fit: BoxFit.fill,
                            scale: 1,
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
              Container(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height -50,
              child: Form(
                    key: _form,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                                    Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Center(
        child: Text("English",
        style: TextStyle(
          color:Colors.white,
          fontSize: 20,
        ),),
      ),
    ),
  
                                 SizedBox(
                                   height: 20,
                                 ),
        
                                    Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Center(
        child: Text("العربیہ",
        style: TextStyle(
          color:Colors.white,
          fontSize: 20,
        ),),
      ),
    ),
  
                              SizedBox(
                                   height: 20,
                                 ),
                                    Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Center(
        child: Text("Ressturent",
        style: TextStyle(
          color:Colors.white,
          fontSize: 20,
        ),),
      ),
    ),
  
                                 SizedBox(
                                   height: 20,
                                 ),
                                    Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Center(
        child: Text("Shop",
        style: TextStyle(
          color:Colors.white,
          fontSize: 20,
        ),),
      ),
    ),
  
                                          SizedBox(
                                            height: 100,
                                          )
                                   ]
                          )
                ),
              )
            
            

            ],),
          ),
        ),
        
      ),
    );
  }
}