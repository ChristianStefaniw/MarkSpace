import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mark_space_app/widgets/teacher/student/student_profile_information.dart';


class StudentProfile extends StatelessWidget {
  final Map profile;

  StudentProfile({this.profile});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff000080),
        title: Text("${this.profile['name']}\'s profile"),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[400],
          ),
          StudentProfileInformation(this.profile),
        ],
      ),
    );
  }
}
