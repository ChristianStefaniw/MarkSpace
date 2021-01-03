import 'package:flutter/material.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';
import 'package:mark_space_app/utils/ui/app_dialogs/sub_marks_dialog.dart';

class SingleContentGrades extends StatelessWidget {
  final AssessmentData assessment;

  SingleContentGrades({@required this.assessment});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.assessment.marks.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 10,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: InkWell(
            splashColor: SECONDARY_LIGHT,
            onTap: () {
              return subMarksDialog(context,
                  assessment: this.assessment,
                  title: this.assessment);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    this.assessment.name,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
