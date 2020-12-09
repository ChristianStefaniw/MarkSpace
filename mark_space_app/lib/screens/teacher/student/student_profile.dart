import 'package:flutter/material.dart';
import 'package:mark_space_app/models/teacher/get_student_profile_data.dart';


class StudentProfile extends StatelessWidget {

  final GetStudentProfileData profile;
  StudentProfile({this.profile});

  @override
  Widget build(BuildContext context) {

    Map _data = this.profile.data;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff000080),
        title: Text("${_data['name']}\'s profile"),
      ),
      body: Column(
        children: [
          Text("Name: ${_data['name']}"),
          Text("Marks: ${_data['marks']}")
        ],
      ),
    );
  }
}
