import 'package:coffe_type/screens/authenticate/authonticate.dart';
import 'package:coffe_type/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffe_type/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return aither home or auth widget
    if (user == null) {
      return Authanticate();
    } else {
      return Home();
    }
  }
}
