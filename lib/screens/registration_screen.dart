import 'package:chat_flutter_app/components/rounded_btn.dart';
import 'package:chat_flutter_app/constant.dart';
import 'package:chat_flutter_app/screens/login_screens.dart';
import 'package:flutter/material.dart';


class RegistrationScrren extends StatefulWidget {
  static const String id = 'registration_screen';
  const RegistrationScrren({Key? key}) : super(key: key);

  @override
  State<RegistrationScrren> createState() => _RegistrationScrrenState();
}
class _RegistrationScrrenState extends State<RegistrationScrren> with SingleTickerProviderStateMixin {

   late AnimationController controller;
   late Animation animation;

   @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2  ),
      vsync: this,
    );

    controller.forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);


    controller.addListener(() {
      setState(() {
        // print(controller.value);
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/logo.png'),
                  height: animation.value * 130,
                ),
              ),
              SizedBox(height: 12.0,),
              TextField(
                onChanged: (value){},
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFieldDecoration.copyWith(hintText: 'Full Name')
              ),
              SizedBox(height: 10.0,),
              TextField(
                onChanged: (value){},
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFieldDecoration.copyWith(hintText: 'Email')
              ),
              SizedBox(height: 10.0,),
              TextField(
                onChanged: (value){},
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kTextFieldDecoration.copyWith(hintText: 'Password')
              ),
              SizedBox(height: 14.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RoundedButton(
                  title: 'Register',
                  btnColor: Colors.lightBlueAccent,
                  Pressed: () {},),
              ),
              SizedBox(height: 14.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: (){
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Text('Already Have Account',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black54,
                        color: Colors.black54,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
