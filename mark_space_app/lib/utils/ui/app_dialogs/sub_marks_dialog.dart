import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

subMarksSingleContentDialog(context, {Map student}) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      student['assessment']['subs']['weight'] =
          "${student['assessment']['weight']}%";
      return SimpleDialog(
        title: Text(
          "${student['studentName']}",
          textAlign: TextAlign.center,
        ),
        children: student['assessment']['subs']
            .entries
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

subMarksStudentProfile(context, {Map assessment}) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      assessment['marks']['subs']['weight'] = "${assessment['marks']['subs']['weight']}%";
      return SimpleDialog(
        title: Text(
          "${assessment['name']}",
          textAlign: TextAlign.center,
        ),
        children: assessment['marks']['subs']
            .entries
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
