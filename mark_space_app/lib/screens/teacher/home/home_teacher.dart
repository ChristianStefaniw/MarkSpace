import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/teacher/teacher_data.dart';
import 'package:mark_space_app/modules/providers/all_classes_provider.dart';
import 'package:mark_space_app/utils/services/classes/deserialize_classes_units_students.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/widgets/teacher/home/classes_grid.dart';
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
              onPressed: () => Navigator.pushNamed(context, CREATE_CLASS,
                  arguments: TeacherData().id),
            )
          ]),
      body: Container(
        color: BACKGROUND,
        child: Consumer<AllClassesProvider>(
          builder: (context, model, child) {
            return Classes(
              email: "teacher.teacher@tdsb.on.ca",
              user: user,
            );
          },
        ),
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
    return FutureBuilder<List>(
      future: DeserializeClassesUnitsStudents.previewClasses(this.email),
      builder: (_, previewClassCards) {
        if (previewClassCards.hasData) {
          TeacherData _teacher = TeacherData(
              email: this.email,
              name: this.user,
              previewClasses: previewClassCards.data);
          return ClassesGrid(_teacher.previewClasses);
        } else {
          return Center(
            child: SpinKitCubeGrid(
              color: Colors.red,
            ),
          );
        }
      },
    );
  }
}
