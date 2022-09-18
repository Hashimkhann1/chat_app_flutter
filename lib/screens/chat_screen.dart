import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
final _auth = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
late User loggedInUser;
class _ChatScreenState extends State<ChatScreen> {

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  String? message;
  VoidCallback getCurrentUser = () {
    final user = _auth.currentUser;
    if(user != null){
      loggedInUser = user;
      print(user.email);
    };
  };

  VoidCallback getMessages = () async {
    // final messages = await _firestore.collection('messages').get();
    // for(var message in messages.docs){
    //   print(message.data());
    // }
    await for(var snapshot in _firestore.collection('messages').snapshots()){
      for(var message in snapshot.docs){
        print(message.data());
      }
    }
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          IconButton(onPressed: () {
            getMessages();
            // _auth.signOut();
            // Navigator.pop(context);
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
                        message = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Type your message here...',
                        hintStyle: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),

                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: (){
                        
                        print(message);
                        _firestore.collection('messages').add({
                          'text':message,
                          'sender' : loggedInUser.email
                        });
                      },
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
