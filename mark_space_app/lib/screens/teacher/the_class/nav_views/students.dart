import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/utils/services/class_student_cards/create_student_cards.dart';
import 'package:mark_space_app/widgets/teacher/student/student_grid.dart';

class TheClass extends StatelessWidget {
  final ClassData classData;

  TheClass(this.classData);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CreateStudentCards(context, classData: this.classData)
          .generateCards(),
      builder: (_, studentCards) {
        if (studentCards.hasData) {
          return StudentGrid(studentCards.data);
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
