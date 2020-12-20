import 'package:flutter/material.dart';


import './average_label.dart';
import './email_button.dart';
import './student_profile_grade.dart';

class StudentProfileInformation extends StatelessWidget {

  final Map profile;


  StudentProfileInformation(this.profile);

  List<StudentProfileGrade> _studentGrades(Map marks) {
    List<StudentProfileGrade> _grades = [];
    marks.forEach(
          (unit, section) {
        section.forEach(
              (element) {
            _grades.add(
              StudentProfileGrade(
                info: element,
              ),
            );
          },
        );
      },
    );
    return _grades;
  }



  @override
  Widget build(BuildContext context) {

    List<StudentProfileGrade> _grades = this._studentGrades(this.profile['marks']);

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
        AverageLabel(this.profile['average']),
        EmailButton(this.profile['email']),
      ],
    );
  }
}
