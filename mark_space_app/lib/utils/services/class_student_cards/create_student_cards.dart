import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/config/theme/colors.dart';

import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/modules/models/teacher/student_profile_data.dart';
import 'package:mark_space_app/utils/services/classes/deserialize_classes.dart';

class CreateStudentCards {
  final ClassData classData;
  final BuildContext context;

  CreateStudentCards(this.context, {this.classData});

  Future<List<Widget>> generateCards() async {
    Random random = new Random();
    List<StudentProfileData> _studentData =
        await DeserializeClasses.fetchStudentData(classData.id);

    List<Widget> _studentCards = [];

    _studentData.forEach(
      (student) {
        Color avatarBackground =
            STUDENT_CARD_COLORS[random.nextInt(STUDENT_CARD_COLORS.length - 1)];
        _studentCards.add(createCard(student, avatarBackground));
      },
    );

    return _studentCards;
  }

  Widget createCard(StudentProfileData student, Color avatarBackground) {
    return Card(
      child: MaterialButton(
        onPressed: () => Navigator.pushNamed(this.context, STUDENT_PROFILE,
            arguments: student),
        child:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundColor: avatarBackground,
                child: Text(student.name[0]),
              ),
              Text(
                student.name,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
