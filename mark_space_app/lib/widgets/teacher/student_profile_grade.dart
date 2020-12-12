import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentProfileGrade extends StatelessWidget {
  final String grade;
  final String assessment;

  StudentProfileGrade({this.grade, this.assessment});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  this.assessment,
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
              onTap: ()=>print('sub-grades'),
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(vertical: 28.h),
                child: Text(
                  this.grade,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
