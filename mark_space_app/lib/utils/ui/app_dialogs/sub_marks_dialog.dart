import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

subMarksSingleContentDialog(context, {@required Map student}) {
  Map _formatStudent() {
    Map _formattedStudent = {};

    _formattedStudent
        .addAll({'grade': student['assessment']['marks'][0]['grade']});

    _formattedStudent.addAll({'weight': student['assessment']['weight']});

    student['assessment']['marks'][0]['subs'].forEach(
      (sub, mark) {
        _formattedStudent.addAll({sub: mark});
      },
    );
    return _formattedStudent;
  }

  Map _formattedStudent = _formatStudent();
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return SimpleDialog(
        title: Text(
          "${student['studentName']}",
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

subMarksStudentProfileDialog(context, {@required Map assessment}) {
  Map _formatAssessmentData() {
    Map _formatted = {};
    _formatted.addAll({'grade': assessment['marks'][0]['grade']});
    _formatted.addAll({'weight': assessment['weight']});
    assessment['marks'][0]['subs'].forEach((sub, mark) {
      _formatted.addAll({sub: mark});
    });

    return _formatted;
  }

  Map _formattedAssessment = _formatAssessmentData();

  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return SimpleDialog(
        title: Text(
          "${assessment['name']}",
          textAlign: TextAlign.center,
        ),
        children: _formattedAssessment.entries
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
