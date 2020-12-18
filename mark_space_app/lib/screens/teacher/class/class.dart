import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/models/teacher/class_data.dart';
import 'package:mark_space_app/screens/teacher/class/class_tabs/contents.dart';
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
          backgroundColor: Color(0xff000080),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            unselectedLabelColor: Colors.white,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Colors.blueAccent),
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
