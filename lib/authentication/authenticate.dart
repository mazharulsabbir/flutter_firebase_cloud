import 'package:flutter/material.dart';
import 'package:flutter_firebase_cloud/authentication/register.dart';
import 'package:flutter_firebase_cloud/authentication/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toogleScreens() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showSignIn
          ? SignIn(
              toogleScreen: toogleScreens,
            )
          : Register(
              toogleScreen: toogleScreens,
            ),
    );
  }
}
