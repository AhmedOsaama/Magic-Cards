// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final fontSize;
  final onPressed;
  Button({required this.width, required this.text, required this.height,this.onPressed,this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(15),
      // padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.6),
              spreadRadius: 5,
              blurRadius: 18,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: RaisedButton(
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize?.toDouble() ?? 18,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            fontStyle: FontStyle.normal,
          ),
        ),
        color: Color.fromARGB(255, 35, 132, 149),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7)),
        elevation: 0,
      ),
    );
  }
}
