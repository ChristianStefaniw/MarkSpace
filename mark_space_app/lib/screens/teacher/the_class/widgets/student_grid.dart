import 'package:flutter/material.dart';

import 'package:mark_space_app/utils/helpers/no_scroll_glow.dart';

class StudentGrid extends StatelessWidget {

  final List<Widget> studentCards;

  StudentGrid(this.studentCards);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoScrollGlow(),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height/1.4),
        ),
        itemCount: this.studentCards.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, cardIndex) {
          return studentCards[cardIndex];
        },
      ),
    );
  }
}
