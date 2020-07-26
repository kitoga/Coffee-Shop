import 'package:coffee_shop/screens/services/auth.dart';
import 'package:coffee_shop/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
          value: AuthService().user,
          child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

