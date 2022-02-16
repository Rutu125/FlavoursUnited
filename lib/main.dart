import 'package:firebase_core/firebase_core.dart';
import 'package:flavours_united/screens/about_us_screen.dart';
import 'package:flavours_united/screens/chat_screen.dart';
import 'package:flavours_united/screens/food_screen.dart';
import 'package:flavours_united/screens/food_videos_screen.dart';
import 'package:flavours_united/screens/fu_studios.dart';
import 'package:flavours_united/screens/guitar_screen.dart';
import 'package:flavours_united/screens/login_screen.dart';
import 'package:flavours_united/screens/main_screen.dart';
import 'package:flavours_united/screens/motivation_screen.dart';
import 'package:flavours_united/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(FlavoursUnited());
}

class FlavoursUnited extends StatelessWidget {
  const FlavoursUnited({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        MainScreen.id: (context) => MainScreen(),
        AboutUsScreen.id: (context) => AboutUsScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        FoodScreen.id: (context) => FoodScreen(),
        GuitarScreen.id: (context) => GuitarScreen(),
        FoodVideosScreen.id: (context) => FoodVideosScreen(),
        FUStudios.id: (context) => FUStudios(),
        MotivationScreen.id: (context) => MotivationScreen(),
      },
    );
  }
}
