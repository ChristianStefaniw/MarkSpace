import 'package:flutter/material.dart';
import 'package:mark_space_app/modules/providers/all_classes_provider.dart';

import 'package:mark_space_app/screens/teacher/home_teacher.dart';
import 'package:mark_space_app/config/routes/router.dart' as Router;
import 'package:provider/provider.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new AllClassesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Router.Router.generateRoute,
        home: HomeTeacher(),
      ),
    );
  }
}
