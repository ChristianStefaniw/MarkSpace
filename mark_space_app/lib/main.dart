import 'package:flutter/material.dart';
import 'package:mark_space_app/widgets/inherited.dart';
import 'package:mark_space_app/screens/teacher/home_teacher.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
