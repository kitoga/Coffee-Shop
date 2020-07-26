import 'package:coffee_shop/models/model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase
  User _userFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change  user stream
  Stream <User> get user{
    return _auth.onAuthStateChanged.map(_userFirebaseUser);
  }

  //sign in anon
  Future signInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFirebaseUser(user);
    }
    catch (e){
      print(e.toString());
      return null;
    }
  }

  //sign in email & password

  //register with email & password

  //sign out

}