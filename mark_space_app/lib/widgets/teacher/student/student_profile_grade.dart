import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mark_space_app/utils/ui/app_dialogs/sub_marks_dialog.dart';

class StudentProfileGrade extends StatelessWidget {
  final Map assessment;

  StudentProfileGrade({this.assessment});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Card(
              child: InkWell(
                splashColor: Colors.grey[500],
                onTap: () => print("open test photo"),
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 28.h),
                  child: Text(
                    this.assessment['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Card(
              child: InkWell(
                splashColor: Colors.grey[500],
                onTap: () {
                  return subMarksStudentProfile(context, assessment: this.assessment);
                },
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 28.h),
                  child: Text(
                    '${this.assessment['marks']['grade']}%',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
