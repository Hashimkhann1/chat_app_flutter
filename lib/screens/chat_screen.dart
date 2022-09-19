import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


final _firestore = FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
final messageTextController = TextEditingController();
final _auth = FirebaseAuth.instance;
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
    };
  };

  VoidCallback getMessages = () async {
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
            MyMessageStrem(),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.lightBlueAccent, width: 2.0)
                )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
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
                        messageTextController.clear();
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


class MyMessageStrem extends StatelessWidget {
  const MyMessageStrem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context , snapshot){
        List<MessageBubble> messageBubbles = [];
        if(snapshot.hasData){
          final messages = snapshot.data?.docs;
          for(var message in messages!){
            final messageText = message.get('text');
            final messageSender = message.get('sender');

            final messageBubble = MessageBubble(text: messageText , sender: messageSender,);
            messageBubbles.add(messageBubble);
          }
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10.0 , vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}



class MessageBubble extends StatelessWidget {
  MessageBubble({this.text , this.sender});

  final String? text;
  final String? sender;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(sender.toString(),
            style: TextStyle(
              fontSize: 12.0,
                color: Colors.black45
            ),),
          Material(
            borderRadius: BorderRadius.circular(24.0),
            elevation: 5.0,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0 , vertical: 14.0),
              child: Text(text.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0
                ),
              ),
            ),
          ),
        ],
      ),
    );;
  }
}
