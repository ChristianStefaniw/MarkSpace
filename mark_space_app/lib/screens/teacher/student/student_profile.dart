import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:mark_space_app/models/teacher/student_profile_data.dart';
import 'package:mark_space_app/widgets/teacher/student_profile_grade.dart';

class StudentProfile extends StatelessWidget {
  final StudentProfileData profile;

  StudentProfile({this.profile});

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

  _sendMail(String email) async{
    final uri = "mailto:$email";
    if (await canLaunch(uri)){
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }

  }

  @override
  Widget build(BuildContext context) {
    Map _data = this.profile.data;
    List<StudentProfileGrade> _grades = _studentGrades(_data['marks']);

    double _avg = _data['average'];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff000080),
        title: Text("${_data['name']}\'s profile"),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[400],
          ),
          Column(
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
                child: Text("Average: $_avg%"),
              ),
              MaterialButton(
                onPressed: () => _sendMail(_data['email']),
                child: Container(
                  child: Text("Email: ${_data['email']}"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
