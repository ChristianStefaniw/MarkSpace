import 'package:flutter/material.dart';

import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/modules/models/teacher/student_profile_data.dart';
import 'create_class_table_interface.dart';

class CreateClassTable implements CreateClassTableInterface {
  final ClassData classData;

  CreateClassTable(this.classData);

  static const List<String> HEADINGS = ["Name", "Grade"];

  Future<List<TableRow>> createTable(BuildContext context) async {
    Color color;
    List<StudentProfileData> _studentData = await this.classData.studentData;

    List<TableRow> _rows = <TableRow>[
      new TableRow(
          decoration: BoxDecoration(
            color: TABLE_HEADING_BACKGROUND,
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
                      vertical: BorderSide(color: PRIMARY),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      e,
                      style: TextStyle(color: PRIMARY),
                    ),
                  ),
                ),
              )
              .toList())
    ];

    for (int i = 0; i < _studentData.length; i++) {
      i % 2 == 0 ? color = TABLE_EVEN : color = TABLE_ODD;
      _rows.add(tableRow(_studentData[i], color, context));
    }

    return _rows;
  }

  TableRow tableRow(
      StudentProfileData profile, Color color, BuildContext context) {
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
                  horizontal: BorderSide(color: BORDER),
                ),
              ),
              child: Center(
                  child: Text(
                i == 0 ? profile.name : '${profile.average}%',
                textAlign: TextAlign.center,
              )),
            ),
            onTap: () {
              Navigator.pushNamed(context, STUDENT_PROFILE,
                  arguments: profile);
            },
          ),
        ),
    ]);
  }
}
