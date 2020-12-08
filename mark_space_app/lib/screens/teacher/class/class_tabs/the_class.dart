import 'package:flutter/material.dart';
import 'package:mark_space_app/net/teacher/get_student_profile_data.dart';
import 'package:mark_space_app/screens/teacher/student/student_profile.dart';

import 'package:mark_space_app/widgets/inherited.dart';
import 'package:page_transition/page_transition.dart';

class TheClass extends StatelessWidget {
  static const List<String> HEADINGS = ["Name", "Grade"];

  List<TableRow> createTable(BuildContext context) {
    Color color;

    List _data = MyInheritedWidget.of(context).data.getData();

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

    for (int i = 0; i < _data.length; i++) {
      i % 2 == 0 ? color = Color(0xffDCDCDC) : color = Colors.grey;
      _rows.add(_tableRow(_data[i], color, context));
    }

    return _rows;
  }

  void student(
      String email, String name, String classID, BuildContext context) {
    GetStudentProfileData _studentProfile =
        GetStudentProfileData(email: email, name: name, classID: classID);

    Navigator.push(
      context,
      PageTransition(
          type: PageTransitionType.topToBottom,
          child: MyInheritedWidget(
            child: StudentProfile(
              profile: _studentProfile,
            ),
          )),
    );
  }

  TableRow _tableRow(Map element, Color color, BuildContext context) {
    Map temp = new Map.from(element);
    temp.remove('email');
    return TableRow(children: [
      for (String key in temp.keys)
        Container(
          height: 80,
          child: InkWell(
            child: Ink(
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                color: color,
                border: Border.symmetric(horizontal: BorderSide(color: Colors.black),),
              ),
              child: Center(
                  child: Text(
                element[key],
                textAlign: TextAlign.center,
              )),
            ),
            onTap: () {
              student(element['email'], element['name'],
                  MyInheritedWidget.of(context).data.classID, context);
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
