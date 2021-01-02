import 'package:flutter/material.dart';
import 'package:mark_space_app/screens/teacher/the_class/widgets/student_grid.dart';

import 'package:mark_space_app/utils/services/class_student_cards/create_student_cards.dart';
import 'package:mark_space_app/modules/models/classes/class_data.dart';

class TheClass extends StatelessWidget {
  final ClassData classData;

  TheClass(this.classData);

  @override
  Widget build(BuildContext context) {
    return StudentGrid(
        CreateStudentCards(context, classData: this.classData).generateCards());
  }
}
