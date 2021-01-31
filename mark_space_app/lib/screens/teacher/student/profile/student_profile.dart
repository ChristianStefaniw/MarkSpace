import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:mark_space_app/config/routes/arguments/mark_information_arguments.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';
import 'package:mark_space_app/modules/models/student/student_profile_data.dart';
import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';
import 'package:mark_space_app/widgets/custom_dropdown.dart';

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
      body: Center(
        child: Container(
          width: bootstrapContainerWidth(
              MediaQuery.of(context).size.width),
          child: ListView.builder(
            itemCount: this.profile.marks.length,
            itemBuilder: (_, unit) {
              return Card(
                elevation: 5.0,
                child: new Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: SECONDARY_LIGHT,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: CustomDropdownButton(
                      hint: Text(this.profile.marks[unit].name),
                      items: this.profile.marks[unit].assessments.map(
                        (assessment) {
                          return DropdownMenuItem(
                            value: assessment,
                            child: new Text(assessment.name),
                          );
                        },
                      ).toList(),
                      onChanged: (AssessmentData assessment) {
                        Navigator.pushNamed(
                          context,
                          MARK_INFORMATION,
                          arguments: MarkInformationArguments(
                              assessmentData: assessment,
                              unitName: this.profile.marks[unit].name,
                              student: this.profile),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/*
  _sendMail(String email) async {
    final uri = "mailto:$email";
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
 */
