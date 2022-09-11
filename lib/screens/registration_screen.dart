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
                decoration: InputDecoration(
                    hintText: 'Full Name',
                    hintStyle: TextStyle(
                        color: Colors.black38
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
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
              SizedBox(height: 10.0,),
              TextField(
                onChanged: (value){},
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        color: Colors.black38
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
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
              SizedBox(height: 10.0,),
              TextField(
                onChanged: (value){},
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        color: Colors.black38
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
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
              Padding(

                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(24.0),
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text(
                      'Register'
                    ),
                  ),
                ),
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
