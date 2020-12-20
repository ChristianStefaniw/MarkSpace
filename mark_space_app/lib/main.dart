import 'package:flutter/material.dart';

import 'package:mark_space_app/screens/teacher/home_teacher.dart';
import 'package:mark_space_app/config/routes/router.dart' as Router;


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.Router.generateRoute,
      home: HomeTeacher(),
    );
  }
}
