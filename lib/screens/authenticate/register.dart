import 'package:coffee_shop/services/auth.dart';
import 'package:coffee_shop/shared/constant.dart';
import 'package:coffee_shop/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  
  //constructor of toggleview
  final Function toggleView;
  Register({this.toggleView});

  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  //text field
  String email = '';
  String password = '';
  String error = '';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register with'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            onPressed: (){
              widget.toggleView();
            },
          )
        ],
      ),
       body: Container(
         padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
         child: Form(
           key: _formkey,
           child: Column(
             children: <Widget>[
               SizedBox(height: 20,),
               TextFormField(
                 decoration: textInputDecoration.copyWith(hintText: 'Email'),
                 validator: (val) => val.isEmpty ? 'Enter email address': null,
                 onChanged: (val) {
                   setState(() {
                     email = val;
                   });
                 },
               ),
               SizedBox(height: 15,),
               TextFormField(
                 decoration: textInputDecoration.copyWith(hintText: 'Password'),
                 obscureText: true,
                 validator: (val) => val.isEmpty ? 'Enter correct password' : null,
                 onChanged: (val) {
                   setState(() {
                     password = val;
                   });
                 },
               ),
               SizedBox(height: 10,),
               RaisedButton(
                 textColor: Colors.black,
                 onPressed: () async {
                   if(_formkey.currentState.validate()){
                     setState(() {
                       loading = true;
                     });
                     dynamic result  = await _auth.registerWithEmailAndPassword(email, password);
                     if(result == null){
                       setState(() {
                         error = 'Please put in valid email and password';
                         loading = false;
                       });
                     }
                   }
                 },
                 child: Text('register'),
               ),
               SizedBox(height: 12,),
               Text(
                 error,
                 style: TextStyle(color: Colors.red, fontSize: 12),
               )
             ],
           ),
         ),
       ),
    );
  }
}