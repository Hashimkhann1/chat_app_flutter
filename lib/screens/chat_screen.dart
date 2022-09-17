import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
final _auth = FirebaseAuth.instance;
User? loggedInUser;
class _ChatScreenState extends State<ChatScreen> {

  void getCurrentUser = () {
    // final user = await _auth.currentUser();
    final user = _auth.currentUser;
    if(user != null){
      loggedInUser = user;
    };
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          IconButton(onPressed: () {
            _auth.signOut();
            Navigator.pop(context);
          },
              icon: Icon(Icons.close))
        ],
        title: Text('⚡️Chat'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.black
                      ),
                      onChanged: (value){
                        // print(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your message',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),

                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Text('Send',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700
                        ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
