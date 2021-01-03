import 'package:flutter/material.dart';
import 'package:mark_space_app/modules/providers/all_classes_provider.dart';

import 'package:mark_space_app/config/routes/router.dart' as Router;
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/screens/authentication/login/login_screen_email.dart';
import 'package:mark_space_app/screens/teacher/home/home_teacher.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new AllClassesProvider()),
        ChangeNotifierProvider(create: (_) => new ClassDataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Router.Router.generateRoute,
        home: HomeTeacher(),
      ),
    );
  }
}
