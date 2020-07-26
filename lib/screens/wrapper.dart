//import 'package:coffee_shop/screens/Home/home.dart';
import 'package:coffee_shop/models/model.dart';
import 'package:coffee_shop/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //instance of user
    final user  = Provider.of<User>(context);
    print(user);

    return Authenticate(); 
  }
}