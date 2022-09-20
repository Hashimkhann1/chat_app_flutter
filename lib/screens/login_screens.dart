import 'package:chat_flutter_app/components/rounded_btn.dart';
import 'package:chat_flutter_app/constant.dart';
import 'package:chat_flutter_app/screens/chat_screen.dart';
import 'package:chat_flutter_app/screens/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late AnimationController controller;
  late Animation animation;
  bool showSpiner = false;

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
      body: ModalProgressHUD(
        inAsyncCall: showSpiner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value * 130,
                  ),
                ),
              ),
              TextField(
                style: TextStyle(
                  color: Colors.black
                ),
                onChanged: (value){
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter Your Email')
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                onChanged: (value){
                  password = value;
                },
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
                Pressed: () async{
                  setState(() {
                    showSpiner = true;
                  });
                  try{
                  final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  // final testUser = _auth.signInWithPopup(provider)
                  if(user != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                    setState(() {
                      showSpiner = false;
                    });
                  }
                  }catch(e){
                    print('error while loging user $e');
                  }
                },),
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
      ),
    );
  }
}