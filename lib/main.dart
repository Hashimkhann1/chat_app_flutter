import 'package:chat_flutter_app/screens/chat_screen.dart';
import 'package:chat_flutter_app/screens/login_screens.dart';
import 'package:chat_flutter_app/screens/registration_screen.dart';
import 'package:chat_flutter_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  const FlashChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54)
        )
      ),
      initialRoute: 'welcome_screen',
      routes: {
        'welcome_screen' : (context) => WelcomeScreen(),
        'login_screen' : (context) => LoginScreen(),
        'chat_screen' : (context) => ChatScreen(),
        'registration_screen' : (context) => RegistrationScrren()
      },
    );
  }
}
