import 'package:flutter/material.dart';
import 'package:flutter_firebase_cloud/services/auth.dart';
import 'package:flutter_firebase_cloud/utils/apputils.dart';

class SignIn extends StatefulWidget {
  SignIn({this.toogleScreen});
  final Function toogleScreen;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final AppUtils _utils = AppUtils();

  final _formKey = GlobalKey<FormState>();

  String error = '';
  String passError = '';

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
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                    errorText: error.isNotEmpty ? error : null,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  validator: (value) =>
                      value.length < 6 ? 'Password should be 6+ chars' : null,
                  onChanged: (value) => _password = value,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    errorText: passError.isNotEmpty ? passError : null,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      if (_utils.validateEmail(_email)) {
                        print(_password);
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            _email, _password);

                        _firebaseErrorMessage(result.toString());
                        setState(() {
                          error = null;
                          passError = null;
                        });
                      } else {
                        setState(() {
                          error = "Enter a valid email";
                        });
                      }
                    }
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

  void _firebaseErrorMessage(String error) {
    if (error == "ERROR_WRONG_PASSWORD") {
      setState(() {
        passError = "Your password is wrong.";
      });
    } else {
      error = _utils.firebaseErrorMessages(error);
    }
  }
}
