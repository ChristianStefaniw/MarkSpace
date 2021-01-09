import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:mark_space_app/screens/authentication/login/login_screen_email.dart';
import 'package:mark_space_app/screens/authentication/login/login_screen_password.dart';
import 'package:mark_space_app/screens/teacher/home/home_teacher.dart';
import 'package:mark_space_app/screens/teacher/student/profile/student_profile.dart';
import 'package:mark_space_app/screens/teacher/the_class/add_student/add_student.dart';
import 'package:mark_space_app/screens/teacher/the_class/single_content/single_content.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/screens/teacher/home/create_class/create_class.dart';
import 'package:mark_space_app/config/routes/arguments/mark_information_arguments.dart';
import 'package:mark_space_app/config/routes/arguments/single_content_arguments.dart';
import 'package:mark_space_app/screens/teacher/student/profile/mark_information.dart';
import 'package:mark_space_app/screens/teacher/the_class/teacher_class.dart';
import 'package:mark_space_app/screens/teacher/the_class/create_unit/create_unit_form.dart';
import 'package:mark_space_app/screens/teacher/the_class/create_assessment/create_assessment_form.dart';
import 'package:mark_space_app/screens/teacher/the_class/create_assessment/for_which_unit.dart';

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
          StudentProfile(profile: settings.arguments),
        );

      case SINGLE_CONTENT:
        final SingleContentArguments args = settings.arguments;
        return _transition(
          SingleContent(
            args.assessment,
            unitName: args.unitName,
          ),
        );
      case CREATE_CLASS:
        return _transition(
          CreateClass(
            teacherId: settings.arguments,
          ),
        );

      case ADD_STUDENT:
        return _transition(
          AddStudent(),
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
        final MarkInformationArguments _args = settings.arguments;
        return _transition(
          MarkInformation(
              assessmentData: _args.assessmentData,
              unitName: _args.unitName,
              studentName: _args.studentName),
        );

      case CREATE_UNIT:
        return _transition(CreateUnit());

      case CREATE_ASSESSMENT:
        return _transition(ForWhichUnit());

      case CREATE_ASSESSMENT_FORM:
        return _transition(
          CreateAssessmentForm(
            unitId: settings.arguments,
          ),
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

  static PageTransition _transition(child) {
    return PageTransition(
      type: PageTransitionType.topToBottom,
      child: child,
    );
  }
}
