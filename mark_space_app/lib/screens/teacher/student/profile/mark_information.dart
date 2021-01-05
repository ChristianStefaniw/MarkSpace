import 'package:flutter/material.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';
import 'package:mark_space_app/screens/teacher/student/profile/widgets/mark_information_card.dart';
import 'package:mark_space_app/widgets/background_decorations/wavy_header.dart';
import 'package:mark_space_app/widgets/bootstrap_container.dart';

class MarkInformation extends StatelessWidget {
  final AssessmentData assessmentData;
  final String unitName;
  final String studentName;

  MarkInformation({this.assessmentData, this.unitName, this.studentName});

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
                            colors: assessmentInfo,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Text(
                        "Weight: ${this.assessmentData.weight}%",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
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
                            colors: signUpGradients,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                      ),
                      child: Text(
                        "Student: ${this.studentName}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                    ),
                  ],
                ),
              ],
            ),
            BootstrapContainer(
              children: this
                  .assessmentData
                  .marks
                  .map(
                    (mark) => MarkInformationCard(mark),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
