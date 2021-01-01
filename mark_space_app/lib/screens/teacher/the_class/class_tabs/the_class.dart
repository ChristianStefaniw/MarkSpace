import 'package:flutter/material.dart';

import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/widgets/teacher/the_class/students.dart';

class TheClass extends StatelessWidget {
  final ClassData classData;

  TheClass(this.classData);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: BACKGROUND,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Students(this.classData),
          ),
        ),
      ],
    );
  }
}
