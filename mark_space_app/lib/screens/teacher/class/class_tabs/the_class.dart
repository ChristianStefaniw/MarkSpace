import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:mark_space_app/models/teacher/student_profile_data.dart';
import 'package:mark_space_app/screens/teacher/student/student_profile.dart';
import 'package:mark_space_app/widgets/teacher/inherited/single_class_data_inherited.dart';

class TheClass extends StatelessWidget {
  static const List<String> HEADINGS = ["Name", "Grade"];

  List<TableRow> createTable(BuildContext context) {
    Color color;

    List<TableRow> _rows = <TableRow>[
      new TableRow(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
            ),
          ),
          children: HEADINGS
              .map(
                (e) => Container(
                  height: 50,
                  padding: EdgeInsets.all(7.0),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(color: Colors.white),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      e,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
              .toList())
    ];

    for (int i = 0;
        i < SingleClassDataInherited.of(context).classData.studentData.length;
        i++) {
      i % 2 == 0 ? color = Color(0xffDCDCDC) : color = Color(0xffBEBEBE);
      _rows.add(_tableRow(
          SingleClassDataInherited.of(context).classData.studentData[i],
          color,
          context));
    }

    return _rows;
  }

  void student(StudentProfileData studentProfileData, BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.topToBottom,
          child: StudentProfile(
            profile: studentProfileData,
          )),
    );
  }

  TableRow _tableRow(
      StudentProfileData profile, Color color, BuildContext context) {
    return TableRow(children: [
      for (String selection in ['name', 'average'])
        Container(
          height: 80,
          child: InkWell(
            child: Ink(
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                color: color,
                border: Border.symmetric(
                  horizontal: BorderSide(color: Colors.black),
                ),
              ),
              child: Center(
                  child: Text(
                profile.data[selection].toString(),
                textAlign: TextAlign.center,
              )),
            ),
            onTap: () {
              student(profile, context);
            },
          ),
        ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(
              color: Colors.black26, width: 1, style: BorderStyle.none),
          children: createTable(context),
        ),
      ),
    );
  }
}
