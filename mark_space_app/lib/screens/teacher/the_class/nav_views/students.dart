import 'package:flutter/material.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/screens/teacher/the_class/widgets/student_grid.dart';

import 'package:mark_space_app/utils/services/class_student_cards/create_student_cards.dart';
import 'package:provider/provider.dart';

class TheClass extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StudentGrid(
        CreateStudentCards(context, classData: Provider.of<ClassDataProvider>(context, listen: false).classData).generateCards());
  }
}
