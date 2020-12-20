import 'package:flutter/material.dart';
import 'package:mark_space_app/models/teacher/class_data.dart';
import 'package:mark_space_app/widgets/teacher/class/the_class_content.dart';


class TheClass extends StatelessWidget {
  final ClassData classData;

  TheClass(this.classData);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TheClassContent(this.classData),
      ),
    );
  }
}
