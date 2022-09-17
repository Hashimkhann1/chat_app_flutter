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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('Chat screen'),
          ],
        ),
      ),
    );
  }
}
