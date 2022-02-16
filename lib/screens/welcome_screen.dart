import 'package:flavours_united/screens/login_screen.dart';
import 'package:flavours_united/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flavours_united/components/welcome_screen_button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 4,
      ),
    );

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    animation = ColorTween(
      begin: Colors.deepOrangeAccent,
      end: Colors.white,
    ).animate(controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.jpeg'),
                    height: 150.0,
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Flexible(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Flavours United',
                        textStyle: TextStyle(
                          fontFamily: 'Slabo27px',
                          fontSize: 52.0,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            RoundedButton(
                colour: Colors.deepOrange,
                title: 'Login',
                press: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                colour: Colors.deepOrange,
                title: 'Register',
                press: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
          ],
        ),
      ),
    );
  }
}
