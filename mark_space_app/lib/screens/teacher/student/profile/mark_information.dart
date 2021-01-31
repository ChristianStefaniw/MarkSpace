import 'package:flutter/material.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';
import 'package:mark_space_app/modules/models/student/student_profile_data.dart';
import 'package:mark_space_app/screens/teacher/student/profile/widgets/mark_information_card.dart';
import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';
import 'package:mark_space_app/widgets/background_decorations/wavy_header.dart';

class MarkInformation extends StatelessWidget {
  final AssessmentData assessmentData;
  final String unitName;
  final StudentProfileData student;

  MarkInformation({this.assessmentData, this.unitName, this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: NAVBAR,
        title: Text("${this.unitName} - ${this.assessmentData.name}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                WavyHeader(),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        gradient: LinearGradient(
                            colors: AQUA_GRADIENTS,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Weight:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' ${this.assessmentData.weight}%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        gradient: LinearGradient(
                          colors: ORANGE_GRADIENTS,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Student:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            TextSpan(
                              text: ' ${this.student.name}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Container(
                width:
                    bootstrapContainerWidth(MediaQuery.of(context).size.width),
                child: MarkInformationCard(
                  this.assessmentData.marks.firstWhere((element) =>
                      element.student.studentId == this.student.studentId),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
