import 'package:flutter/material.dart';

import 'package:mark_space_app/modules/models/student/student_profile_data.dart';
import 'average_label.dart';
import 'email_button.dart';
import 'student_profile_grade.dart';

class StudentProfileInformation extends StatelessWidget {
  final StudentProfileData profile;

  StudentProfileInformation(this.profile);

  List<StudentProfileGrade> _studentGrades(List grades) {
    List<StudentProfileGrade> _grades = [];
    grades.forEach((unit) {
      unit['assessments'].forEach((assessment) {
        _grades.add(StudentProfileGrade(assessment: assessment,));
      });
    });

    return _grades;
  }

  @override
  Widget build(BuildContext context) {
    List<StudentProfileGrade> _grades = this._studentGrades(this.profile.marks);
    return Column(
      children: [
        ListView.builder(
          itemCount: _grades.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              child: _grades[index],
              margin: EdgeInsets.symmetric(vertical: 4),
            );
          },
        ),
        AverageLabel(this.profile.average),
        EmailButton(this.profile.email),
      ],
    );
  }
}
