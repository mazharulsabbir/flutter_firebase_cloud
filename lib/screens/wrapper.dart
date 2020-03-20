import 'package:flutter/material.dart';
import 'package:flutter_firebase_cloud/authentication/authenticate.dart';
import 'package:flutter_firebase_cloud/models/user.dart';
import 'package:flutter_firebase_cloud/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either home or authenticate 
    return user == null ? Authenticate() : Home();
  }
}
