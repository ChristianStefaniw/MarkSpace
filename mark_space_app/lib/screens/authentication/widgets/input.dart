import 'package:flutter/material.dart';

///CODE CREDITS TO https://github.com/SubirZ

class Input extends StatelessWidget {
  final double topRight;
  final double bottomRight;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String route;

  Input(this.topRight, this.bottomRight, {this.controller, this.hintText, @required this.obscureText, @required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 40, bottom: 30),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        child: Material(
          elevation: 10,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(this.bottomRight),
                  topRight: Radius.circular(this.topRight))),
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 20, top: 10, bottom: 10),
            child: TextField(
              onSubmitted: (_) => Navigator.pushNamed(context, route),
              obscureText: this.obscureText,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: this.hintText,
                  hintStyle: TextStyle(color: Color(0xFFE1E1E1), fontSize: 14)),
            ),
          ),
        ),
      ),
    );
  }
}