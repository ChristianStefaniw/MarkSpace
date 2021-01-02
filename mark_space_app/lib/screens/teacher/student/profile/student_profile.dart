import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/student/student_profile_data.dart';
import 'package:mark_space_app/screens/teacher/student/profile/widgets/student_profile_information.dart';

class StudentProfile extends StatelessWidget {
  final StudentProfileData profile;

  StudentProfile({@required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: NAVBAR,
        title: Text("${this.profile.name}\'s profile"),
      ),
      backgroundColor: BACKGROUND,
      body: StudentProfileInformation(this.profile),
    );
  }
}
