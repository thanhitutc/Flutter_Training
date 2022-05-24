import 'package:basicstudy/src/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void _onClickEvent(String messages) {
    showAlertDialog(messages);
  }

  void _onGoToLogin() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen())
    );
  }

  void showAlertDialog(String messages) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("My title"),
      content: Text(messages),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: this.context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(36, 36, 36, 0),
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                  Colors.deepOrangeAccent,
                  Colors.pink,
                ])),
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Image.asset('icon.png'),
              Padding(
                padding: const EdgeInsets.only(top: 18, bottom: 70),
                child: Text('Find and Meet people around \n you to find LOVE',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center),
              ),
              InkWell(
                child: Container(
                  constraints: BoxConstraints.loose(Size(double.infinity, 60)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(18, 12, 20, 12),
                        child: Image.asset('ic_facebook.png')),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 12, 10, 12),
                        child: Image.asset('img_line.png')),
                    Text(
                      'Sign in with Facebook',
                      style: TextStyle(
                          fontSize: 16,
                          foreground: Paint()
                            ..shader = LinearGradient(
                              colors: <Color>[
                                Colors.deepOrangeAccent,
                                Colors.pink
                                //add more color here.
                              ],
                            ).createShader(
                                Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))),
                    )
                  ]),
                ),
                onTap: () {
                  _onClickEvent('Sign in with Facebook');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 26, bottom: 26),
                child: InkWell(
                  child: Container(
                    constraints:
                        BoxConstraints.loose(Size(double.infinity, 60)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Row(children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(18, 18, 10, 18),
                          child: Image.asset('ic_twitter.png')),
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 14, 10, 14),
                          child: Image.asset('img_line.png')),
                      Text(
                        'Sign in with Twitter',
                        style: TextStyle(
                            fontSize: 16,
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: <Color>[
                                  Colors.deepOrangeAccent,
                                  Colors.pink
                                  //add more color here.
                                ],
                              ).createShader(
                                  Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))),
                      )
                    ]),
                  ),
                  onTap: () {
                    _onClickEvent('Sign in with Twitter');
                  },
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: <Color>[
                              Colors.deepOrangeAccent,
                              Colors.pink
                              //add more color here.
                            ],
                          ).createShader(
                              Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))),
                    backgroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 66),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                    )),
                onPressed: () {
                  _onClickEvent('Sign up');
                },
                child: Text('Sign Up'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36),
                child: RichText(
                  text: TextSpan(
                    text: 'ALREADY REGISTERED SIGN IN',
                    style: TextStyle(
                        fontSize: 16, decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        _onGoToLogin();
                      },
                  ),
                ),
              )
            ]))));
  }
}
