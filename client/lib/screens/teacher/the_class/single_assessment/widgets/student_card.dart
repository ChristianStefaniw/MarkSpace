import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/modules/models/marks/mark_data.dart';
import 'package:mark_space_app/utils/helpers/rand_color.dart';
import 'package:mark_space_app/config/routes/arguments/mark_information_arguments.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';

class StudentCard extends StatelessWidget {
  final MarkData markData;
  final AssessmentData assessmentData;
  final String unitName;

  StudentCard({this.markData, this.assessmentData, this.unitName});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: IntrinsicHeight(
        child: MaterialButton(
          onPressed: () => Navigator.pushNamed(
            context,
            MARK_INFORMATION,
            arguments: MarkInformationArguments(
              assessmentData: this.assessmentData,
              unitName: this.unitName,
              student: this.markData.student,
            ),
          ),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    this.markData.student.name,
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalDivider(
                  color: Colors.black,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "${this.markData.grade}%",
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalDivider(
                  color: Colors.black,
                ),
                Expanded(
                    flex: 1,
                    child: CircleAvatar(
                        child: Text(
                          this.markData.student.name[0].toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: RandColor().color(STUDENT_CARD_COLORS),
                        radius: 25.h)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
