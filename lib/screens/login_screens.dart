import 'package:chat_flutter_app/components/rounded_btn.dart';
import 'package:chat_flutter_app/constant.dart';
import 'package:chat_flutter_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller  = AnimationController(
      duration: Duration(seconds: 2),
        vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      // print(controller.value);
      setState(() {

      });
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                child: Image.asset('images/logo.png'),
                height: animation.value * 130,
              ),
            ),
            TextField(
              style: TextStyle(
                color: Colors.black
              ),
              onChanged: (value){},
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Your Email')
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              onChanged: (value){},
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              style: TextStyle(
                color: Colors.black
              ),
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Your Password'),
            ),
            SizedBox(height: 14.0,),
            RoundedButton(
              title: 'Login',
              btnColor: Colors.lightBlueAccent,
              Pressed: () {},),
            SizedBox(height: 8.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: (){
                    Navigator.pushNamed(context, RegistrationScrren.id);
                  },
                  child: Text('Create New Account ',
                    style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                    decoration: TextDecoration.underline,
                      decorationColor: Colors.black54
                  ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}