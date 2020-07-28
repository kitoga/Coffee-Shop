import 'package:coffee_shop/services/auth.dart';
import 'package:coffee_shop/shared/constant.dart';
import 'package:coffee_shop/shared/loading.dart';
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
  bool loading = false;

  //text field state
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
                 decoration: textInputDecoration.copyWith(hintText: 'Email'),
                 validator: (val) => val.isEmpty ? 'Enter email address' : null,
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
                    dynamic result  = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null){
                       setState(() {
                         error = 'could not sign in with credentials';
                         loading = false;
                       });
                     }
                   }
                 },
                 child: Text('sign in'),
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