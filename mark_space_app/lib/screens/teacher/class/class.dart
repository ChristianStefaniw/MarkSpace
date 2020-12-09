import 'package:flutter/material.dart';
import 'package:mark_space_app/models/teacher/class_data.dart';

import 'package:mark_space_app/screens/teacher/class/class_tabs/contents.dart';
import 'package:mark_space_app/widgets/inherited/single_class_data_inherited.dart';
import 'class_tabs/the_class.dart';

class TeachersClass extends StatelessWidget {

  final ClassData data;

  TeachersClass(this.data);

  @override
  Widget build(BuildContext context) {

    return SingleClassDataInherited(
      classData: data,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
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
              TheClass(),
              Contents(),
            ],
          ),
        ),
      ),
    );
  }
}
