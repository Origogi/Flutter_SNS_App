import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sns_app/constant/constants.dart';
import 'package:flutter_sns_app/page/sign_in_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        backgroundColor: Color(0xFF7DB9E6),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInPage()),
                    );
                  },
                  child: Hero(
                    tag: "signin",
                    child: Container(
                      decoration:
                          buttonDecoration.copyWith(color: Color(0xFF322C56)),
                      width: double.infinity,
                      height: 70,
                      child: Center(
                          child: Text(
                        'Sign In',
                        style:
                            textTheme.headline2.copyWith(color: Colors.white),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: buttonDecoration.copyWith(color: Colors.white),
                    width: double.infinity,
                    height: 70,
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: textTheme.headline2
                            .copyWith(color: Color(0xFF322C56)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
