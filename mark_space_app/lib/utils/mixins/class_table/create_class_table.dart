import 'package:flutter/material.dart';
import 'package:mark_space_app/config/routes/routes.dart';

import 'package:mark_space_app/modules/models/teacher/student_profile_data.dart';
import 'create_class_table_interface.dart';

class CreateClassTable implements CreateClassTableInterface {
  final classData;

  CreateClassTable(this.classData);

  static const List<String> HEADINGS = ["Name", "Grade"];

  Future<List<TableRow>> createTable(BuildContext context) async {
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

    for (int i = 0; i < this.classData.studentData.length; i++) {
      i % 2 == 0 ? color = Color(0xffDCDCDC) : color = Color(0xffBEBEBE);
      _rows.add(await tableRow(this.classData.studentData[i], color, context));
    }

    return _rows;
  }

  void student(StudentProfileData studentProfileData, BuildContext context) {
    Navigator.pushNamed(context, STUDENT_PROFILE,
        arguments: studentProfileData);
  }

  Future<TableRow> tableRow(
      StudentProfileData profile, Color color, BuildContext context) async {
    return TableRow(children: [
      for (int i = 0; i < 2; i++)
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
                i == 0 ? profile.name : '${profile.average}%',
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
}
