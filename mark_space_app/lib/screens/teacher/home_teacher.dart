import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/teacher/teacher_data.dart';
import 'package:mark_space_app/modules/providers/all_classes_provider.dart';
import 'package:mark_space_app/widgets/teacher/home/classes_grid.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:provider/provider.dart';

class HomeTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(1080, 1920));

    String user = "Christian";

    return Scaffold(
      appBar: AppBar(
          title: Text("Welcome $user"),
          centerTitle: true,
          backgroundColor: NAVBAR,
          leading: Image.asset(
            'assets/images/apple.png',
          ),
          actions: [
            IconButton(
              tooltip: "Create Class",
              icon: Icon(Icons.add),
              color: PRIMARY,
              onPressed: () =>
                  Navigator.pushNamed(context, CREATE_CLASS, arguments: 1),
            )
          ]),
      body: Stack(
        children: [
          Container(
            color: BACKGROUND,
          ),
          Transform(
            alignment: FractionalOffset.topRight,
            transform: Matrix4.rotationZ(0.1),
            child: Container(
              decoration: BoxDecoration(
                color: BACKGROUND_DECORATION,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(1000),
                ),
              ),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Consumer<AllClassesProvider>(
            builder: (context, model, child) {
              return Classes(
                email: "teacher.teacher@tdsb.on.ca",
                user: user,
              );
            },
          ),
        ],
      ),
    );
  }
}

class Classes extends StatelessWidget {
  final String email;
  final String user;

  const Classes({Key key, this.email, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TeacherData>(
      future: TeacherData.getClasses(
          email: 'teacher.teacher@tdsb.on.ca', name: user),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ClassesGrid(snapshot.data.classes);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
