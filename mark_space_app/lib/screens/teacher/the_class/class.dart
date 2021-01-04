import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

import 'package:mark_space_app/screens/teacher/the_class/nav_views/announcements.dart';
import 'package:mark_space_app/screens/teacher/the_class/nav_views/contents.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/config/routes/arguments/add_student_arguments.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'nav_views/students.dart';

class TeachersClass extends StatefulWidget {
  @override
  _TeachersClassState createState() => _TeachersClassState();
}

class _TeachersClassState extends State<TeachersClass> {
  final GlobalKey _bottomNavigationKey = GlobalKey();
  Widget _page;

  Widget _whichScreen(Pages page) {
    switch (page) {
      case Pages.students:
        return TheClass();
        break;
      case Pages.content:
        return Contents();
        break;
      case Pages.announcements:
        return Announcements();
      default:
        return TheClass();
    }
  }

  @override
  void initState() {
    _page = _whichScreen(Pages.students);
    super.initState();
  }

  void _somethingChanged(Pages page) {
    setState(() {
      _page = _whichScreen(page);
    });
  }

  @override
  Widget build(BuildContext context) {
    ClassData _classData =
        Provider.of<ClassDataProvider>(context, listen: false).classData;

    return LoaderOverlay(
      overlayWidget: Center(
        child: SpinKitCubeGrid(
          color: Colors.red,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              margin: EdgeInsets.only(right: 7.w),
              child: IconButton(
                tooltip: "Add Student",
                icon: Icon(Icons.person_add),
                onPressed: () => Navigator.pushNamed(
                  context,
                  ADD_STUDENT,
                  arguments: AddStudentArguments(
                      () => _somethingChanged(Pages.students), _classData.id),
                ),
              ),
            ),
            IconButton(
              tooltip: "Add Unit",
              icon: Icon(Icons.add),
              onPressed: () => print('add unit'),
            ),
          ],
          title: Text("${_classData.name} - ${_classData.period}"),
          backgroundColor: NAVBAR,
          centerTitle: true,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.person, size: 30),
            Icon(Icons.assessment, size: 30),
            Icon(Icons.message_outlined, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: BACKGROUND,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            Pages _newPage;
            index == 0 ? _newPage = Pages.students : null;
            index == 1 ? _newPage = Pages.content : null;
            index == 2 ? _newPage = Pages.announcements : null;
            setState(() {
              _page = _whichScreen(_newPage);
            });
          },
          letIndexChange: (index) => true,
        ),
        backgroundColor: BACKGROUND,
        body: _page,
      ),
    );
  }
}

enum Pages { students, content, announcements }
