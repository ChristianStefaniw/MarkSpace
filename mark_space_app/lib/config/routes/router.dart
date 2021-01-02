import 'package:flutter/material.dart';

import 'package:mark_space_app/screens/teacher/home/home_teacher.dart';
import 'package:mark_space_app/screens/teacher/student/profile/student_profile.dart';
import 'package:mark_space_app/screens/teacher/the_class/class.dart';
import 'package:mark_space_app/screens/teacher/the_class/single_content.dart';
import 'package:page_transition/page_transition.dart';
import 'package:mark_space_app/config/routes/arguments/single_content_arguments.dart';
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
          TeachersClass(settings.arguments),
        );

      case STUDENT_PROFILE:
        return _transition(
          StudentProfile(profile: settings.arguments),
        );
      case SINGLE_CONTENT:
        final SingleContentArguments args = settings.arguments;
        return _transition(
          SingleContent(
            classData: args.classData,
            unit: args.unit,
          ),
        );
      case CREATE_CLASS:
        return _transition(
          CreateClass(teacherId: settings.arguments),
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
