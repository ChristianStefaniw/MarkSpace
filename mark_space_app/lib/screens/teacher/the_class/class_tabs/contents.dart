import 'package:flutter/material.dart';
import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/widgets/teacher/the_class/class_contents_contents.dart';

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
        TheClassContentsContents(this.classData),
      ],
    );
  }
}
