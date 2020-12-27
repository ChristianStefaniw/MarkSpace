import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mark_space_app/config/themes/theme_data.dart';
import 'package:mark_space_app/modules/models/teacher/student_profile_data.dart';

import 'package:mark_space_app/widgets/teacher/student/student_profile_information.dart';


class StudentProfile extends StatelessWidget {
  final StudentProfileData profile;

  StudentProfile({this.profile});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: NAVBAR,
        title: Text("${this.profile.name}\'s profile"),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: BACKGROUND,
          ),
          StudentProfileInformation(this.profile),
        ],
      ),
    );
  }
}
