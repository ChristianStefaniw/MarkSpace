import 'package:flutter/material.dart';
import 'package:mark_space_app/config/theme/colors.dart';

import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';

class Announcements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Card(
            margin: const EdgeInsets.all(15.0),
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: bootstrapContainerWidth(MediaQuery.of(context).size.width),
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
          ),
        )
      ],
    );
  }
}
