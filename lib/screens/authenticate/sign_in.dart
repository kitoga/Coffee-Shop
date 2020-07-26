import 'package:coffee_shop/screens/services/auth.dart';
import 'package:coffee_shop/shared/constant.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  
  //constructor of toggleview
  final Function toggleView;
  SignIn({this.toggleView});

  _SignInState createState() => _SignInState();

}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();

  //text field
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign with'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('register'),
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
                 decoration: textInputDecoration,
                 validator: (val) => val.isEmpty ? 'Enter email address' : null,
                 onChanged: (val) {
                   setState(() {
                     email = val;
                   });
                 },
               ),
               SizedBox(height: 15,),
               TextFormField(
                 decoration: textInputDecoration,
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
                   print(email);
                   print(password);
                 },
                 child: Text('sign in'),
               )
             ],
           ),
         ),
       ),
    );
  }
}