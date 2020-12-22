import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mark_space_app/modules/models/teacher/teacher_data.dart';

import 'package:mark_space_app/widgets/teacher/home/classes_grid.dart';

class HomeTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(1080, 1920));

    String user = "Christian";


    return Scaffold(
        appBar: AppBar(
            title: Text("Welcome $user"),
            centerTitle: true,
            backgroundColor: Color(0xff000080),
            leading: Image.asset(
              'assets/images/apple.png',
            ),
            actions: [
              IconButton(
                tooltip: "Add class",
                icon: Icon(Icons.add),
                color: Colors.white,
                onPressed: () => print("add class"),
              )
            ]
        ),
        body: Stack(
          children: [
            Container(
              color: Color(0xffE8E8E8),
            ),
            Transform(
              alignment: FractionalOffset.topRight,
              transform: Matrix4.rotationZ(0.1),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(1000),
                  ),
                ),
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
              ),
            ),
            FutureBuilder<TeacherData>(
              future: TeacherData.getClasses(email: 'first.last@tdsb.on.ca', name: user),
              builder: (context, snapshot) {
                return snapshot.hasData ? ClassesGrid(snapshot.data.classes) : Center(child: CircularProgressIndicator(),);
              }
            ),
          ],
        )
    );
  }
}
