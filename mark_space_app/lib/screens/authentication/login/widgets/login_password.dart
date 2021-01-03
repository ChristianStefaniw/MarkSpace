import 'package:flutter/material.dart';

import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/screens/authentication/widgets/input.dart';
import 'package:mark_space_app/screens/authentication/widgets/rounded_rect_button.dart';

class LoginPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.3),
        ),
        Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 40, bottom: 10),
                  child: Text(
                    "Password",
                    style: TextStyle(fontSize: 16, color: Color(0xFF999A9A)),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Input(30.0, 0.0, hintText: "password", obscureText: true, route: TEACHER_HOME,),

                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, TEACHER_HOME),
              child: RoundedRectButton(
                title: "Login",
                gradient: signInGradients,
                isEndIconVisible: false,
              ),
            ),
          ],
        )
      ],
    );
  }
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];
