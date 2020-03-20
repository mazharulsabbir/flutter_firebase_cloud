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

  final _formKey = GlobalKey<FormState>();

  String error = '';

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
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) => value.isEmpty ? 'Enter an email' : null,
                  onChanged: (value) => _email = value,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) =>
                      value.length < 6 ? 'Password should be 6+ chars' : null,
                  onChanged: (value) => _password = value,
                  obscureText: true,
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      print(_password);
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          _email, _password);
                      if (result == null) {
                        setState(() {
                          error = 'Please supply a valid email';
                        });
                      }
                    }
                  },
                  child: Text('Sign In'),
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
