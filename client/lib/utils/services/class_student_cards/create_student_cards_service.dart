import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mark_space_app/constants/api_constants.dart';

import 'package:mark_space_app/modules/models/classes/class_data.dart';

import 'package:mark_space_app/modules/models/marks/unit_data.dart';
import 'package:mark_space_app/modules/models/student/student_profile_data.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/utils/helpers/no_scroll_glow.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/utils/helpers/rand_color.dart';
import 'package:mark_space_app/utils/services/api_service/http_requests_service.dart';
import 'package:mark_space_app/utils/services/deserialization/deserialize.dart';
import 'package:provider/provider.dart';

class CreateStudentCards {
  final ClassData classData;
  final BuildContext context;

  CreateStudentCards(this.context, {this.classData});

  List<Widget> generateCards() {
    Color avatarBackground;

    List<Widget> _studentCards = this.classData.students.map(
      (student) {
        avatarBackground = RandColor().color(STUDENT_CARD_COLORS);
        return createCard(student, avatarBackground);
      },
    ).toList();

    return _studentCards;
  }

  Widget createCard(StudentProfileData student, Color avatarBackground) {
    List<String> _splitName = student.name.split(' ');
    String _name = _splitName.reduce((value, element) {
      return value + "\n" + element;
    });

    return Card(
      child: MaterialButton(
        onPressed: () async {
          this.context.showLoaderOverlay();
          List<UnitData> _units = await HTTPRequests()
              .get("$EMAIL_QUERY_STUDENT_URL${student.email}$CLASS_QUERY_FOR_STUDENT${Provider.of<ClassDataProvider>(context, listen: false).classData.id}")
              .then(
            (response) {
              return Deserialize.deserializeStudentAssessments(response[0], classData: this.classData);
            },
          );
          student.marks = _units;
          this.context.hideLoaderOverlay();
          Navigator.pushNamed(this.context, STUDENT_PROFILE,
              arguments: student);
        },
        child: Center(
          child: ScrollConfiguration(
            behavior: NoScrollGlow(),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              children: [
                CircleAvatar(
                  backgroundColor: avatarBackground,
                  child: Text(
                    student.name[0].toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.h),
                  ),
                  radius: 30.h,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "$_name",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.h),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
