import 'package:chat_flutter_app/components/rounded_btn.dart';
import 'package:chat_flutter_app/constant.dart';
import 'package:chat_flutter_app/screens/chat_screen.dart';
import 'package:chat_flutter_app/screens/login_screens.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class RegistrationScrren extends StatefulWidget {
  static const String id = 'registration_screen';
  const RegistrationScrren({Key? key}) : super(key: key);

  @override
  State<RegistrationScrren> createState() => _RegistrationScrrenState();
}
class _RegistrationScrrenState extends State<RegistrationScrren> with SingleTickerProviderStateMixin {

  final _auth = FirebaseAuth.instance;
   late AnimationController controller;
   late Animation animation;
   late String email;
   late String password;
   bool showSpiner = false;

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
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: animation.value * 130,
                    ),
                  ),
                ),
                SizedBox(height: 12.0,),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    email = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldDecoration.copyWith(hintText: 'Email')
                ),
                SizedBox(height: 10.0,),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    password = value;
                  },
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
                    Pressed: () async {
                      setState(() {
                        showSpiner = true;
                      });
                      try{
                        final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        if(newUser != null){
                          Navigator.pushNamed(context, ChatScreen.id);
                          print(newUser);
                        }
                        setState(() {
                          showSpiner = false;
                        });
                      }
                      catch(error){
                        print('erorr while creating new user $error');
                      }
                    },),
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
      ),
    );
  }
}
