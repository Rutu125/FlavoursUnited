import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavours_united/constants.dart';
import 'package:flavours_united/screens/about_us_screen.dart';
import 'package:flavours_united/screens/chat_screen.dart';
import 'package:flavours_united/screens/food_screen.dart';
import 'package:flavours_united/screens/food_videos_screen.dart';
import 'package:flavours_united/screens/fu_studios.dart';
import 'package:flavours_united/screens/guitar_screen.dart';
import 'package:flavours_united/screens/motivation_screen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final _auth = FirebaseAuth.instance;
late User loginUser;

void getCurrentUser() async {
  try {
    final user = await _auth.currentUser;
    if (user != null) {
      loginUser = user;
    }
  } catch (e) {
    print(e);
  }
}

class MainScreen extends StatefulWidget {
  static String id = 'main_screen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flavours United'),
          backgroundColor: Colors.deepOrangeAccent,
          actions: [
            IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                height: 240.0,
                child: DrawerHeader(
                  child: Padding(
                    padding: EdgeInsets.only(top: 25.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/logo.jpeg'),
                          radius: 55.0,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Flavours United',
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                ),
              ),
              ListTile(
                title: Text(
                  'Chat Section',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, ChatScreen.id);
                },
              ),
              ListTile(
                title: Text(
                  'Food Photos',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, FoodScreen.id);
                },
              ),
              ListTile(
                title: Text(
                  'Food Videos',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, FoodVideosScreen.id);
                },
              ),
              ListTile(
                title: Text(
                  'Guitar Videos',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, GuitarScreen.id);
                },
              ),
              ListTile(
                title: Text(
                  'FU Studios',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, FUStudios.id);
                },
              ),
              ListTile(
                title: Text(
                  'Maitreya Maheshwari Motivations',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, MotivationScreen.id);
                },
              ),
              ListTile(
                title: Text(
                  'About us',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, AboutUsScreen.id);
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 35.0, color: Colors.black54),
              ),
              SizedBox(
                height: 30.0,
              ),
              Center(
                child: Image(
                  image: AssetImage('images/all.jpeg'),
                  height: 310.0,
                ),
              ),
            ],
          ),
        ));
  }
}
