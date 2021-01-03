import 'package:flutter/material.dart';
import 'package:mark_space_app/config/routes/arguments/add_student_arguments.dart';

import 'package:mark_space_app/screens/authentication/login/login_screen_email.dart';
import 'package:mark_space_app/screens/authentication/login/login_screen_password.dart';
import 'package:mark_space_app/screens/teacher/home/home_teacher.dart';
import 'package:mark_space_app/screens/teacher/student/profile/student_profile.dart';
import 'package:mark_space_app/screens/teacher/the_class/add_student/add_student.dart';
import 'package:mark_space_app/screens/teacher/the_class/class.dart';
import 'package:mark_space_app/screens/teacher/the_class/single_content.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/screens/teacher/home/create_class/create_class.dart';

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
        return _transition(
          SingleContent(
            assessment: settings.arguments,
          ),
        );
      case CREATE_CLASS:
        return _transition(
          CreateClass(teacherId: settings.arguments),
        );

      case ADD_STUDENT:
        final AddStudentArguments args = settings.arguments;
        return _transition(
          AddStudent(
            classId: args.classId,
            update: args.update,
          ),
        );

      case LOGIN_EMAIL:
        return _transition(
          LoginScreenEmail(),
        );

      case LOGIN_PASSWORD:
        return _transition(
          LoginScreenPassword(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }

  static PageTransition _transition(child) {
    return PageTransition(
      type: PageTransitionType.topToBottom,
      child: child,
    );
  }
}
