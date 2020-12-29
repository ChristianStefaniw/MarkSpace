import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/screens/teacher/the_class/class_tabs/contents.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'class_tabs/the_class.dart';

class TeachersClass extends StatelessWidget {
  final ClassData data;

  TeachersClass(this.data);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              margin: EdgeInsets.only(right: 7.w),
              child: IconButton(
                tooltip: "Add student",
                icon: Icon(Icons.person_add),
                onPressed: () => print('add student'),
              ),
            ),
            IconButton(
              tooltip: "Add unit",
              icon: Icon(Icons.add),
              onPressed: () => print('add unit'),
            ),
          ],
          title: Text("${data.name} - ${data.period}"),
          backgroundColor: NAVBAR,
          centerTitle: true,
          bottom: TabBar(
            labelColor: PRIMARY,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            unselectedLabelColor: PRIMARY,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: TAB_BACKGROUND,
            ),
            tabs: [
              Tab(
                text: "Class",
              ),
              Tab(
                text: "Content",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TheClass(data),
            Contents(data),
          ],
        ),
      ),
    );
  }
}
