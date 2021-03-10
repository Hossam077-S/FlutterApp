import 'package:coffe_type/screens/authenticate/register.dart';
import 'package:coffe_type/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authanticate extends StatefulWidget {
  @override
  _AuthanticateState createState() => _AuthanticateState();
}

class _AuthanticateState extends State<Authanticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIN(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
