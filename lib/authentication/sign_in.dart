import 'package:flutter/material.dart';
import 'package:flutter_firebase_cloud/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to continue"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
        child: RaisedButton(
          onPressed: () async {
            dynamic res = await _auth.signInAnnon();
            if (res == null) {
              print('error signed in');
            } else {
              print('signed in');
              print(res.uid);
            }
          },
          child: Text("Sign In Annon"),
        ),
      ),
    );
  }
}
