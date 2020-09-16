import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sns_app/api/user_api.dart';
import 'package:flutter_sns_app/constant/secret.dart';
import 'package:flutter_sns_app/model/user.dart';
import 'package:flutter_sns_app/page/confirm.dart';
import 'package:flutter_sns_app/page/signup.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User _user = User();
  bool _isAuthenticated = false;
  final _userPool = CognitoUserPool(AWS_USER_POOL_ID, AWS_CLIENT_ID);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserService _userService;

  @override
  void initState() {
    super.initState();
    _userService = UserService(_userPool);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getValues(),
        builder: (context, AsyncSnapshot<UserService> snapshot) {
          return Scaffold(
            key: _scaffoldKey,
            body: Stack(
              children: <Widget>[
                Container(
                  height: 650,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: WaveWidget(
                      config: CustomConfig(
                        gradients: [
                          [Colors.deepPurple, Colors.deepPurple.shade200],
                          [Colors.indigo.shade200, Colors.purple.shade200],
                        ],
                        durations: [19440, 10800],
                        heightPercentages: [0.20, 0.25],
                        blur: MaskFilter.blur(BlurStyle.solid, 10),
                        gradientBegin: Alignment.bottomLeft,
                        gradientEnd: Alignment.topRight,
                      ),
                      waveAmplitude: 0,
                      size: Size(
                        double.infinity,
                        double.infinity,
                      ),
                    ),
                  ),
                ),
                ListView(
                  children: <Widget>[
                    Container(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.0)),
                          Card(
                            margin:
                                EdgeInsets.only(left: 30, right: 30, top: 30),
                            elevation: 11,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: TextField(
                              onChanged: (value) {
                                _user.email = value;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black26,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.check_circle,
                                    color: Colors.black26,
                                  ),
                                  hintText: "E-mail",
                                  hintStyle: TextStyle(color: Colors.black26),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 16.0)),
                            ),
                          ),
                          Card(
                            margin:
                                EdgeInsets.only(left: 30, right: 30, top: 20),
                            elevation: 11,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: TextField(
                              onChanged: (value) {
                                _user.password = value;
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black26,
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 16.0)),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(30.0),
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              color: Colors.pink,
                              onPressed: () {
                                submit(context);
                              },
                              elevation: 11,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0))),
                              child: Text("Login",
                                  style: TextStyle(color: Colors.white70)),
                            ),
                          ),
                          Text("Forgot your password?",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("or, connect with"),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: RaisedButton(
                                  child: Text("Facebook"),
                                  textColor: Colors.white,
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),
                                  onPressed: () {
                                    // submit(context);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: RaisedButton(
                                  child: Text("Google"),
                                  textColor: Colors.white,
                                  color: Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Dont have an account?"),
                              FlatButton(
                                child: Text("Sign up"),
                                textColor: Colors.indigo,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage()),
                                  );
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }

  Future<UserService> _getValues() async {
    await _userService.init();
    _isAuthenticated = await _userService.checkAuthenticated();
    return _userService;
  }

  void submit(BuildContext context) async {
    String message;
    try {
      _user = await _userService.login(_user.email, _user.password);
      message = 'User sucessfully logged in!';
      if (!_user.confirmed) {
        message = 'Please confirm user account';
      }
    } on CognitoClientException catch (e) {
      if (e.code == 'InvalidParameterException' ||
          e.code == 'NotAuthorizedException' ||
          e.code == 'UserNotFoundException' ||
          e.code == 'ResourceNotFoundException') {
        message = e.message;
      } else {
        message = 'An unknown client error occured';
      }
    } catch (e) {
      message = 'An unknown error occurred';
    }
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () async {
          if (_user.hasAccess) {
            Navigator.pop(context);
            if (!_user.confirmed) {
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ConfirmationPage(email: _user.email)),
              );
            }
          }
        },
      ),
      duration: Duration(seconds: 30),
    );

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
