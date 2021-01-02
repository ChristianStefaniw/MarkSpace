import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/modules/models/teacher/student_profile_data.dart';
import 'package:mark_space_app/utils/helpers/no_scroll_glow.dart';
import 'package:mark_space_app/utils/services/classes/deserialize_classes.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/config/theme/colors.dart';


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
    List<String> _splitName = student.name.split(' ');
    String _name = _splitName.reduce((value, element) {
      return value + "\n" + element;
    });

    return Card(
      child: MaterialButton(
        onPressed: () => Navigator.pushNamed(this.context, STUDENT_PROFILE,
            arguments: student),
        child:
        Center(
          child: ScrollConfiguration(
            behavior: NoScrollGlow(),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                CircleAvatar(
                  backgroundColor: avatarBackground,
                  child: Text(student.name[0].toUpperCase()),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  "$_name",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
