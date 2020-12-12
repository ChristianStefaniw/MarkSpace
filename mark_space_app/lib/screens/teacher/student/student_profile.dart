import 'package:flutter/material.dart';
import 'package:mark_space_app/models/teacher/get_student_profile_data.dart';
import 'package:mark_space_app/widgets/teacher/student_profile_grade.dart';

class StudentProfile extends StatelessWidget {
  final GetStudentProfileData profile;

  StudentProfile({this.profile});

  List<StudentProfileGrade> _studentGrades(Map data) {
    List<StudentProfileGrade> _grades = [];
    data.forEach((unit, section) {
      section.forEach((assessment, grade) {
        _grades.add(StudentProfileGrade(
          grade: grade,
          assessment: assessment,
        ));
      });
    });
    return _grades;
  }

  @override
  Widget build(BuildContext context) {
    Map _data = this.profile.data;

    List<StudentProfileGrade> _grades = _studentGrades(_data['marks']);

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
                  return Container(child: _grades[index], margin: EdgeInsets.symmetric(vertical: 4),);
                },
              ),
              Container(
                child: Text("Email: ${_data['email']}"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
