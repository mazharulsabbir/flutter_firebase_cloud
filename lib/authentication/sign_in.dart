import 'package:flutter/material.dart';
import 'package:flutter_firebase_cloud/services/auth.dart';

class SignIn extends StatefulWidget {
  SignIn({this.toogleScreen});
  final Function toogleScreen;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String _email = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Sign in"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () {
              widget.toogleScreen();
              print('object');
            },
            icon: Icon(Icons.person_outline),
            label: Text("Sign Up"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
          child: Form(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (value) => _email = value,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  onChanged: (value) => _password = value,
                  obscureText: true,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () async {
                    print('$_email and $_password');
                  },
                  child: Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
