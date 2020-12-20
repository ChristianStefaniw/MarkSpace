import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import './student_profile_grade.dart';

class StudentProfileInformation extends StatelessWidget {

  final Map profile;


  StudentProfileInformation(this.profile);

  List<StudentProfileGrade> _studentGrades(Map data) {
    List<StudentProfileGrade> _grades = [];
    data.forEach(
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

  _sendMail(String email) async {
    final uri = "mailto:$email";
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
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
        Container(
          child: Text("Average: ${this.profile['average']}%"),
        ),
        MaterialButton(
          onPressed: () => this._sendMail(this.profile['email']),
          child: Container(
            child: Text("Email: ${this.profile['email']}"),
          ),
        )
      ],
    );
  }
}
