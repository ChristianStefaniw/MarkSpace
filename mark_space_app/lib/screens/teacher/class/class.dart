import 'package:flutter/material.dart';

import 'package:mark_space_app/screens/teacher/class/class_tabs/contents.dart';
import 'package:mark_space_app/widgets/inherited.dart';
import 'class_tabs/the_class.dart';

class TeachersClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Class ${MyInheritedWidget.of(context).data.id}"),
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
            TheClass(),
            Contents(),
          ],
        ),
      ),
    );
  }
}
