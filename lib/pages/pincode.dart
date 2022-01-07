import 'package:flutter/material.dart';

class ChangePinCode extends StatelessWidget {

  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  final TextEditingController _oldPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Password",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
      ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: 100,
          //  child: TextFormField(
          //                                   decoration: InputDecoration(
          //                                       enabledBorder: OutlineInputBorder(
          //                                         borderRadius:
          //                                             BorderRadius.circular(32),
          //                                         borderSide: BorderSide(
          //                                             color: Colors.green,
          //                                             width: 1),
          //                                       ),
          //                                       labelStyle: TextStyle(
          //                                           color: Colors.green),
          //                                       hintStyle: TextStyle(
          //                                           color: Colors.green,
          //                                           fontSize: 15),
          //                                       // icon: Icon(Icons.mail),
          //                                       prefixIcon: Icon(Icons.lock,
          //                                           color: Colors.green
          //                                               ),
          //                                       suffixIcon: emailController
          //                                               .text.isEmpty
          //                                           ? Text('')
          //                                           : GestureDetector(
          //                                               onTap: () {
          //                                                 _isObscure = !_isObscure;
          //                                               },
          //                                               child: Icon(Icons.remove_red_eye,color: Colors.green,)),
          //                                       hintText: '********',
          //                                       labelText: 'Password',
          //                                       border: OutlineInputBorder(
          //                                         borderRadius:
          //                                             BorderRadius.circular(32),
          //                                         borderSide: BorderSide(
          //                                             color: Colors.green,
          //                                             width: 1),
          //                                       )),
          //                                   obscureText: _isObscure,
          //                                   validator: (value) {
          //                                     if (value.trim().isEmpty) {
          //                                       return 'password is required';
          //                                     }
          //                                     if (value.trim().length < 8) {
          //                                       return 'Password must be at least 8 characters in length';
          //                                     }
          //                                     // Return null if the entered password is valid
          //                                     return null;
          //                                   },
          //                                   onChanged: (value) =>
          //                                       formVal.password = value,
          //                                   onSaved: (value) =>
          //                                       formVal.password = value,
          //                                   style: TextStyle(color: Colors.black),
          //                                   textInputAction: TextInputAction.done,
          //                                 ),
          // )
    
    
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 400),
        child: Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                                                 TextFormField(
                                 controller: _oldPass,
                                    decoration: InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(32),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 1),
                                                    ),
                                                    labelStyle: TextStyle(
                                                        color: Colors.blue),
                                                    hintStyle: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 15),
                                                    // icon: Icon(Icons.mail),
                                                    prefixIcon: Icon(Icons.lock,
                                                        color: Colors.blue
                                                            ),
                                                
                                                    hintText: '********',
                                                    labelText: 'Old Password',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(32),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 1),
                                                    )),
        
                                 validator: (val){
                                    if(val!.isEmpty)
                                         return 'Empty';
                                    return null;
                                    }
                           ),
                           SizedBox(
                             height: 20,
                           ),

                           TextFormField(
                                 controller: _pass,
                                    decoration: InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(32),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 1),
                                                    ),
                                                    labelStyle: TextStyle(
                                                        color: Colors.blue),
                                                    hintStyle: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 15),
                                                    // icon: Icon(Icons.mail),
                                                    prefixIcon: Icon(Icons.lock,
                                                        color: Colors.blue
                                                            ),
                                                
                                                    hintText: '********',
                                                    labelText: 'New Password',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(32),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 1),
                                                    )),
        
                                 validator: (val){
                                    if(val!.isEmpty)
                                         return 'Empty';
                                    return null;
                                    }
                           ),

                        SizedBox(
                             height: 20,
                           ),
                            TextFormField(
                                 controller: _confirmPass,
                                    decoration: InputDecoration(
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(32),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 1),
                                                    ),
                                                    labelStyle: TextStyle(
                                                        color: Colors.blue),
                                                    hintStyle: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 15),
                                                    // icon: Icon(Icons.mail),
                                                    prefixIcon: Icon(Icons.lock,
                                                        color: Colors.blue
                                                            ),
                                                  
                                                    hintText: '********',
                                                    labelText: 'confirm Password',
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(32),
                                                      borderSide: BorderSide(
                                                          color: Colors.blue,
                                                          width: 1),
                                                    )),
               
                                 validator: (val){
                                    if(val!.isEmpty)
                                         return 'Empty';
                                    if(val != _pass.text)
                                         return 'Not Match';
                                    return null;
                                    }
                           ),
                           SizedBox(
                             height: 20,
                           ),
                           Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      padding: const EdgeInsets.symmetric(horizontal: 30,
                                          vertical: 15),
                                      child: FlatButton(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 100),
                                        shape: StadiumBorder(),
                                        onPressed: () {
                                          // _formSubmit();
                                        },
                                        child: Text(
                                          'Reset Password',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        color: Colors.blue,
                                      ),
                                    ),
                             ]
                    )
          ),
        ),
      )
    
    
        ],),
        
      ),
    );
  }
}