import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';


subMarksDialog(context,
    {AssessmentData assessment, title}) {
  Map _formattedAssessment = _formatAssessment({});
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return SimpleDialog(
        title: Text(
          title,
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

Map<String, dynamic> _formatAssessment(Map<String, dynamic> assessment) {
    Map<String, dynamic> _formatted = {};
    _formatted
        .addAll({'grade': assessment['marks'][0]['grade']});

    _formatted.addAll({'weight': assessment['weight']});

    assessment['marks'][0]['subs'].forEach(
          (sub, mark) {
        _formatted.addAll({sub: mark});
      },
    );
    return _formatted;
  }

