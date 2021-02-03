import 'package:flutter/material.dart';

import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/screens/authentication/widgets/input.dart';
import 'package:mark_space_app/screens/authentication/widgets/rounded_rect_button.dart';

class LoginEmail extends StatelessWidget {
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
                    "Email",
                    style: TextStyle(fontSize: 16, color: Color(0xFF999A9A)),
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Input(
                      30.0,
                      0.0,
                      hintText: "john.doe@student.tdsb.on.ca",
                      obscureText: false,
                      route: LOGIN_PASSWORD,
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Container()),
                            GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, LOGIN_PASSWORD),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: ShapeDecoration(
                                  shape: CircleBorder(),
                                  gradient: LinearGradient(
                                      colors: AQUA_GRADIENTS,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight),
                                ),
                                child: ImageIcon(
                                  AssetImage("assets/icons/ic_forward.png"),
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
            ),
            RoundedRectButton(
              title: "Create an Account",
              gradient: ORANGE_GRADIENTS,
              isEndIconVisible: false,
            ),
          ],
        )
      ],
    );
  }
}