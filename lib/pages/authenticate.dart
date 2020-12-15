import 'package:flutter/material.dart';
import 'package:flutter_phod/pages/register.dart';
import 'package:flutter_phod/pages/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState( () => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: showSignIn
          ? SignIn()
          : Register(toggleView: toggleView)
    );
  }
}
