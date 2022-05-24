import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberPassword = false;

  void _onRememberPasswordChanged(bool? newValue) => setState(() {
        if (newValue == null) {
          return;
        }
        rememberPassword = newValue;
        if (rememberPassword) {
          showAlertDialog('Remember Password');
        } else {
          showAlertDialog('Don\'t Remember Password');
        }
      });

  void _onClickEvent(String messages) {
    showAlertDialog(messages);
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
    return MaterialApp(
      home: Scaffold(
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
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Image.asset('icon.png'),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Text('Find and Meet people around \n you to find LOVE',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center),
                ),
                Text('SIGN IN',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 36, 0, 16),
                  child: TextField(
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    obscureText: false,
                    decoration: InputDecoration(
                        hintText: 'Enter Email',
                        hintStyle:
                            TextStyle(fontSize: 16, color: Colors.white70),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70),
                        )),
                  ),
                ),
                TextField(
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.white70),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      )),
                ),
                Container(
                  constraints: BoxConstraints.loose(Size(double.infinity, 80)),
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 36),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Theme(
                          data: Theme.of(context).copyWith(
                              unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                              value: rememberPassword,
                              onChanged: _onRememberPasswordChanged,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))),
                        ),
                        Text('Remember Password',
                            style: TextStyle(fontSize: 14, color: Colors.white))
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.pinkAccent,
                          textStyle: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          backgroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 66),
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          )),
                      onPressed: () {_onClickEvent('Login');},
                      child: Text('GET STARTED'),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 24, 50, 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: TextButton(
                          onPressed: () {
                            _onClickEvent('Login with facebook');
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  const CircleBorder())),
                          child: ImageIcon(AssetImage('ic_facebook.png'),
                              color: Colors.pinkAccent),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: TextButton(
                          onPressed: () {
                            _onClickEvent('Login with twitter');
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                  const CircleBorder())),
                          child: ImageIcon(
                            AssetImage('ic_twitter.png'),
                            color: Colors.pinkAccent,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Text('FORGOT PASSWORD',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        decoration: TextDecoration.underline)),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    color: Color(0x999A0303),
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: 'DON\'T HAVE ACCOUNT? ',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 14),
                            children: [
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  text: 'SIGN UP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline))
                            ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
