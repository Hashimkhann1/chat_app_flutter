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
              onChanged: (value){},
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
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
                  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0))
                )
              ),
            ),
            SizedBox(height: 14.0,),
            Material(
              elevation: 5.0,
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(24.0),
              child: MaterialButton(
                onPressed: (){},
                child: Text('Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600
                ),),
              ),
            ),
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