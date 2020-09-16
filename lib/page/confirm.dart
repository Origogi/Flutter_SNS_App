import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sns_app/api/user_api.dart';
import 'package:flutter_sns_app/constant/secret.dart';
import 'package:flutter_sns_app/model/user.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class ConfirmationPage extends StatefulWidget {
  final String email;
  ConfirmationPage({Key key, this.email}) : super(key: key);

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String confirmationCode;
  final User _user = User();
  final _userPool = CognitoUserPool(AWS_USER_POOL_ID, AWS_CLIENT_ID);
  UserService _userService;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _userService = UserService(_userPool);
  }

  @override
  Widget build(BuildContext context) {
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
                    Text("Confirm",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0)),
                    Card(
                      margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                      elevation: 11,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
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
                            hintText: "Code",
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
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        color: Colors.pink,
                        onPressed: () {
                          _submit(context);
                        },
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0))),
                        child: Text("Submit",
                            style: TextStyle(color: Colors.white70)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _submit(BuildContext context) async {
    bool accountConfirmed;
    String message;
    try {
      accountConfirmed =
          await _userService.confirmAccount(_user.email, confirmationCode);
      message = 'Account successfully confirmed!';
    } on CognitoClientException catch (e) {
      if (e.code == 'InvalidParameterException' ||
          e.code == 'CodeMismatchException' ||
          e.code == 'NotAuthorizedException' ||
          e.code == 'UserNotFoundException' ||
          e.code == 'ResourceNotFoundException') {
        message = e.message;
      } else {
        print(e.code);
        message = 'Unknown client error occurred';
      }
    } catch (e) {
      message = 'Unknown error occurred';
    }

    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          if (accountConfirmed) {
            // Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => LoginScreen(email: _user.email)),
            // );
          }
        },
      ),
      duration: Duration(seconds: 30),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  _resendConfirmation(BuildContext context) async {
    _formKey.currentState.save();
    String message;
    try {
      await _userService.resendConfirmationCode(_user.email);
      message = 'Confirmation code sent to ${_user.email}!';
    } on CognitoClientException catch (e) {
      if (e.code == 'LimitExceededException' ||
          e.code == 'InvalidParameterException' ||
          e.code == 'ResourceNotFoundException') {
        message = e.message;
      } else {
        message = 'Unknown client error occurred';
      }
    } catch (e) {
      message = 'Unknown error occurred';
    }

    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
      duration: Duration(seconds: 30),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }
}
