import 'package:flutter/material.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation animation;

  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animController.forward();
    animController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'), //TODO WhatsApp 2
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['WhatsApp 2'],
                  textStyle: TextStyle(
                    fontSize: 40.0, //45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                  speed: Duration(milliseconds: 200),
                  pause: Duration(seconds: 3),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
              //Go to login screen.
            ),
            RoundedButton(
              text: 'Register',
              color: Colors.blueAccent,
              onPressed: () =>
                  Navigator.pushNamed(context, RegistrationScreen.id),
              //Go to registration screen.
            )
          ],
        ),
      ),
    );
  }
}