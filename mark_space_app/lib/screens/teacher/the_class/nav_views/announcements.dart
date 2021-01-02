import 'package:flutter/material.dart';
import 'package:mark_space_app/config/theme/colors.dart';

class Announcements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            child: Center(
                child: Text(
              "ANNOUNCEMENTS",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CLASS_CARD_TITLE),
            )),
          ),
        )
      ],
    );
  }
}
