import 'package:flutter/material.dart';

import '../constant/constants.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration:
                            buttonDecoration.copyWith(color: Color(0xFFedf0f7)),
                        width: double.infinity,
                        height: roundButtonHeight,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration:
                            buttonDecoration.copyWith(color: Color(0xFFedf0f7)),
                        width: double.infinity,
                        height: roundButtonHeight,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Hero(
                        tag: 'signin',
                        child: Container(
                          decoration: buttonDecoration.copyWith(
                              color: Color(0xFF322C56)),
                          width: double.infinity,
                          height: roundButtonHeight,
                          child: Center(
                              child: Text(
                            'Sign In',
                            style: textTheme.headline2
                                .copyWith(color: Colors.white),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text('Forgot password?'),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.grey,
                            height: 30,
                            width: 60,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            color: Colors.grey,
                            height: 30,
                            width: 60,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Don't have an account? Sign up")
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
