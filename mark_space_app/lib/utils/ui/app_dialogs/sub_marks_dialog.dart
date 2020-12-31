import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/utils/helpers/format_marks_dialog_data.dart';

subMarksDialog(context,
    {@required Map assessment, @required title}) {
  Map _formattedStudent = FormatMarksDialogData.format(assessment);
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return SimpleDialog(
        title: Text(
          title,
          //"${student['studentName']}",
          textAlign: TextAlign.center,
        ),
        children: _formattedStudent.entries
            .map<Widget>((e) => Container(
                  margin: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    "${e.key} : ${e.value}",
                    textAlign: TextAlign.center,
                  ),
                ))
            .toList(),
      );
    },
  );
}
