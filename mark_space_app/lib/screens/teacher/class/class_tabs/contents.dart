import 'package:flutter/material.dart';
import 'package:mark_space_app/models/teacher/class_data.dart';
import 'package:page_transition/page_transition.dart';

import 'package:mark_space_app/screens/teacher/class/single_content.dart';

class Contents extends StatelessWidget {

  final ClassData classData;
  Contents(this.classData);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey[400],
        ),
        ListView.builder(
          itemCount: this.classData.units.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              elevation: 10,
              child: InkWell(
                splashColor: Colors.white,
                onTap: () => Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.topToBottom,
                    child: SingleContent(classData: this.classData, content: this.classData.units[index],),
                  ),
                ),
                child: Ink(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  child: Text(
                    this.classData.units[index],
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
