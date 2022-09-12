import 'package:flutter/material.dart';



class RoundedButton extends StatelessWidget {

  RoundedButton({this.title , this.btnColor , @required this.Pressed});
  final String? title;
  final Color? btnColor;
  final VoidCallback? Pressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        color: btnColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: Pressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(title.toString()),
        ),
      ),
    );
  }
}