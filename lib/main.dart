import 'package:flutter/material.dart';
import 'package:flutter_sns_app/constant/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: Color(0xFF7DB9E6),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration:
                        buttonDecoration.copyWith(color: Color(0xFF322C56)),
                    width: double.infinity,
                    height: 70,
                    child: Center(
                        child: Text(
                      'Sign In',
                      style: buttonTextStyle.copyWith(color: Colors.white),
                    )),
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
                        style:
                            buttonTextStyle.copyWith(color: Color(0xFF322C56)),
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
