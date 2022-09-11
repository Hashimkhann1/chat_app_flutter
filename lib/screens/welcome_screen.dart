import 'package:chat_flutter_app/screens/login_screens.dart'; // file
import 'package:chat_flutter_app/screens/registration_screen.dart'; // file
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
        vsync: this,

    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();

    controller.addListener(() {
      setState(() {
      });
      // print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: animation.value * 90,
                    ),
                  ),
                  AnimatedTextKit(
                      animatedTexts:
                      [TypewriterAnimatedText('Flash Chat', textStyle:
                      TextStyle(
                          color: Colors.black54,
                        fontWeight: FontWeight.w900,
                        fontSize: 30.0
                      ),
                        speed: Duration(milliseconds: 300)
                      )],
                    totalRepeatCount: 100,
                    pause: const Duration(milliseconds: 100),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  )
                  // Text('Flash Chat',
                  // style: TextStyle(
                  //   color: Colors.black54,
                  //   fontSize: 36.0,
                  //   fontWeight: FontWeight.w900,
                  // ),
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 22.0),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text('Login'),
                  ),
                ),
              ),
              Material(
                color: Colors.blueAccent,
                elevation: 5.0,
                borderRadius: BorderRadius.circular(24.0),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, RegistrationScrren.id);
                  },
                  child: Text('Register'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
