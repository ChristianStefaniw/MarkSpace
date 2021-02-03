import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:mark_space_app/modules/providers/announcement_provider.dart';
import 'package:mark_space_app/modules/providers/marks_provider.dart';
import 'package:provider/provider.dart';

import 'package:mark_space_app/config/routes/router.dart' as Router;
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/screens/authentication/login/login_screen_email.dart';
import 'package:mark_space_app/screens/teacher/home/home_teacher.dart';
import 'package:mark_space_app/modules/providers/all_classes_provider.dart';
import 'package:mark_space_app/modules/providers/students_provider.dart';
import 'package:mark_space_app/modules/providers/units_provider.dart';
import 'config/theme/colors.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
        child: SpinKitCubeGrid(
          color: LOADING_SQUARE,
        ),
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => new AllClassesProvider()),
          ChangeNotifierProvider(create: (_) => new ClassDataProvider()),
          ChangeNotifierProvider(create: (_) => new StudentsProvider()),
          ChangeNotifierProvider(create: (_) => new UnitsProvider()),
          ChangeNotifierProvider(create: (_) => new AnnouncementProvider()),
          ChangeNotifierProvider(create: (_) => new MarksProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Router.Router.generateRoute,
          home: Builder(builder: (context) {
            ScreenUtil.init(context, designSize: Size(1920, 969));
            return HomeTeacher();
          }),
        ),
      ),
    );
  }
}
