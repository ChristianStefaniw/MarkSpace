import 'package:flutter/material.dart';
import 'package:mark_space_app/config/theme/colors.dart';

import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/widgets/teacher/the_class/single_content_grades.dart';

class SingleContent extends StatelessWidget {
  final ClassData classData;
  final String unit;

  SingleContent({@required this.classData, @required this.unit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: NAVBAR,
        title: Text("${this.unit}"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: BACKGROUND,
        child: SingleContentGrades(
          classData: this.classData,
          unit: this.unit,
        ),
      ),
    );
  }
}
