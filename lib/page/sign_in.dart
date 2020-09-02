import 'package:flutter/material.dart';

import '../constant/constants.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: "signin",
            child: Container(
              decoration: buttonDecoration.copyWith(color: Color(0xFF322C56)),
              width: double.infinity,
              height: 70,
              child: Center(
                  child: Text(
                'Sign In',
                style: buttonTextStyle.copyWith(color: Colors.white),
              )),
            ),
          ),
        ],
      )),
    );
  }
}
