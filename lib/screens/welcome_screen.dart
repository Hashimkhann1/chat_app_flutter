import 'package:flutter/material.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Image.asset('images/logo.png'),
                      height: 60.0,
                    ),
                    Text('Flash Chat',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 36.0,
                      fontWeight: FontWeight.w900,
                    ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(30.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: (){},
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
                    onPressed: (){},
                    child: Text('Register'),
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
