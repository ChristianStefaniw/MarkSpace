import 'package:flutter/material.dart';
import 'package:mark_space_app/modules/models/student/student_profile_data.dart';
import 'package:mark_space_app/screens/teacher/the_class/create_announcement/create_announcement_form.dart';
import 'package:page_transition/page_transition.dart';

import 'package:mark_space_app/screens/authentication/login/login_screen_email.dart';
import 'package:mark_space_app/screens/authentication/login/login_screen_password.dart';
import 'package:mark_space_app/screens/teacher/home/home_teacher.dart';
import 'package:mark_space_app/screens/teacher/student/profile/student_profile.dart';
import 'package:mark_space_app/screens/teacher/the_class/add_student/add_student_form.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/screens/teacher/home/create_class/create_class.dart';
import 'package:mark_space_app/config/routes/arguments/mark_information_arguments.dart';
import 'package:mark_space_app/config/routes/arguments/single_assessment_arguments.dart';
import 'package:mark_space_app/screens/teacher/student/profile/mark_information.dart';
import 'package:mark_space_app/screens/teacher/the_class/teacher_class.dart';
import 'package:mark_space_app/screens/teacher/the_class/create_unit/create_unit_form.dart';
import 'package:mark_space_app/screens/teacher/the_class/create_assessment/create_assessment_form.dart';
import 'package:mark_space_app/screens/teacher/the_class/create_assessment/for_which_unit.dart';
import 'package:mark_space_app/screens/teacher/the_class/create_mark/create_mark_form.dart';
import 'package:mark_space_app/screens/teacher/the_class/single_assessment/single_assessment.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TEACHER_HOME:
        return _transition(
          HomeTeacher(),
        );

      case TEACHERS_CLASS:
        return _transition(
          TeachersClass(),
        );

      case STUDENT_PROFILE:
        return _transition(
          StudentProfile(profile: settings.arguments as StudentProfileData),
        );

      case SINGLE_ASSESSMENT:
        final SingleAssessmentArguments args = settings.arguments as SingleAssessmentArguments;
        return _transition(
          SingleAssessment(
            args.assessment,
            unit: args.unit,
          ),
        );
      case CREATE_CLASS:
        return _transition(
          CreateClass(
            teacherId: settings.arguments as String,
          ),
        );

      case ADD_STUDENT:
        return _transition(
          AddStudentForm(),
        );

      case LOGIN_EMAIL:
        return _transition(
          LoginScreenEmail(),
        );

      case LOGIN_PASSWORD:
        return _transition(
          LoginScreenPassword(),
        );

      case MARK_INFORMATION:
        final MarkInformationArguments _args = settings.arguments as MarkInformationArguments;
        return _transition(
          MarkInformation(
              assessmentData: _args.assessmentData,
              unitName: _args.unitName,
              student: _args.student),
        );

      case CREATE_UNIT:
        return _transition(CreateUnit());

      case CREATE_ASSESSMENT:
        return _transition(ForWhichUnit());

      case CREATE_ASSESSMENT_FORM:
        return _transition(
          CreateAssessmentForm(
            unitId: settings.arguments as String,
          ),
        );

      case CREATE_MARK_FORM:
        return _transition(
          CreateMarkForm(
            assessmentId: settings.arguments as String
          )
        );

      case CREATE_ANNOUNCEMENT_FORM:
        return _transition(
          CreateAnnouncementForm()
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  // Fancy page transition
  static PageTransition _transition(child) {
    return PageTransition(
      type: PageTransitionType.topToBottom,
      child: child,
    );
  }
}
