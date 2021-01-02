import 'package:flutter/material.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';

import 'widgets/single_content_grades.dart';

class SingleContent extends StatelessWidget {
  final ClassData classData;
  final AssessmentData assessment;

  SingleContent({@required this.classData, @required this.assessment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: NAVBAR,
        title: Text("${this.assessment.name}"),
      ),
      backgroundColor: BACKGROUND,
      body: SingleContentGrades(
        classData: this.classData,
        assessment: this.assessment,
      ),
    );
  }
}
