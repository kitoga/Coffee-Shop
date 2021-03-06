import 'package:coffee_shop/screens/authenticate/register.dart';
import 'package:coffee_shop/screens/authenticate/sign_in.dart';
//import 'package:coffee_shop/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';


class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView(){
    setState(() {
      showSignIn = ! showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView,);
    }
    else{
      return Register(toggleView: toggleView,);
    }
  }
}