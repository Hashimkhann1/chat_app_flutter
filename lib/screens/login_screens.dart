import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Image.asset('images/logo.png'),
                    height: 80.0,
                  ),
                  Text('Login',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w800,
                    fontSize: 36.0
                  ),)
                ],
              ),
            ),
            TextField(
              style: TextStyle(
                color: Colors.black
              ),
              onChanged: (value){},
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                hintStyle: TextStyle(color: Colors.black38),
                contentPadding:
                EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: 
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0))
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0))
                )
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              style: TextStyle(
                color: Colors.black
              ),
              decoration: InputDecoration(
                hintText: 'Enter Your Password',
                hintStyle: TextStyle(color: Colors.black38),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0 , horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0))
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent),
                  borderRadius: BorderRadius.all(Radius.circular(32.0))
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}