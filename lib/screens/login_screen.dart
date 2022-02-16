import 'package:flavours_united/constants.dart';
import 'package:flavours_united/screens/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flavours_united/components/welcome_screen_button.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  String errorText = 'Error';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/logo.jpeg'),
                  height: 300.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextField(
              onChanged: (value) {
                password = value;
              },
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your Password'),
            ),
            RoundedButton(
                colour: Colors.deepOrangeAccent,
                title: 'Login',
                press: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      print('success');
                      Navigator.pushNamed(context, MainScreen.id);
                    }
                  } catch (e) {
                    print('errror');
                    print(e);

                    if (e.toString() ==
                        '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.') {
                      errorText = 'Invalid Password';
                    } else if (e.toString() ==
                        '[firebase_auth/invalid-email] The email address is badly formatted.') {
                      errorText = 'Invalid Email Address';
                    } else if (e.toString() ==
                        '[firebase_auth/unknown] Given String is empty or null') {
                      errorText = 'Fields are blank';
                    } else if (e.toString() ==
                        '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.') {
                      errorText = 'Account not found';
                    } else {
                      errorText = 'Error';
                    }

                    Alert(
                        context: context,
                        title: 'Error',
                        desc: errorText,
                        buttons: [
                          DialogButton(
                            child: Text(
                              'Cool',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () => Navigator.pop(context),
                            color: Colors.deepOrangeAccent,
                          ),
                        ]).show();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
