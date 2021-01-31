import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/teacher/teacher_data.dart';
import 'package:mark_space_app/modules/providers/all_classes_provider.dart';
import 'package:mark_space_app/screens/teacher/home/widgets/classes_grid.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/utils/services/deserialization/deserialize.dart';

class HomeTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        ],
      ),
      backgroundColor: BACKGROUND,
      body: Consumer<AllClassesProvider>(
        builder: (_, model, child) {
          return Classes(
            email: "teacher.teacher@tdsb.on.ca",
            user: user,
          );
        },
      ),
    );
  }
}

class Classes extends StatelessWidget {
  final String email;
  final String user;

  const Classes({Key key, this.email, this.user});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: Deserialize.previewClasses(this.email),
      builder: (_, previewClassCards) {
        if (previewClassCards.hasData) {
          if (previewClassCards.data.isEmpty){
            return Text("No classes");
          }
          return ClassesGrid(previewClassCards.data);
        } else {
          return Center(
            child: SpinKitCubeGrid(
              color: LOADING_SQUARE,
            ),
          );
        }
      },
    );
  }
}
