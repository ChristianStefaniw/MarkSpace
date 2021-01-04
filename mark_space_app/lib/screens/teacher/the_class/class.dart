import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'nav_views/announcements.dart';
import 'package:mark_space_app/modules/enums/single_class_pages.dart';
import 'package:mark_space_app/screens/teacher/the_class/nav_views/contents.dart';
import 'package:mark_space_app/screens/teacher/the_class/nav_views/students.dart';

class TeachersClass extends StatefulWidget {
  @override
  _TeachersClassState createState() => _TeachersClassState();
}

class _TeachersClassState extends State<TeachersClass> {
  final GlobalKey _bottomNavigationKey = GlobalKey();
  Widget _page;
  final Map<String, Widget> _pageWidgets = {'TheClass': TheClass(), 'Contents': Contents(), 'Announcements': Announcements()};

  void initState(){
    _page = _switchScreen(Pages.students);
    super.initState();
  }


  Widget _switchScreen(Pages page) {
    switch (page) {
      case Pages.students:
        return _pageWidgets['TheClass'];
        break;
      case Pages.content:
        return _pageWidgets['Contents'];
        break;
      case Pages.announcements:
        return _pageWidgets['Announcements'];
        break;
      default:
        return _pageWidgets['TheClass'];
    }
  }

  @override
  Widget build(BuildContext context) {
    ClassData _classData =
        Provider.of<ClassDataProvider>(context, listen: false).classData;

    return Scaffold(
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
        animationDuration: Duration(seconds: 1),
        onTap: (index) {
          Pages _newPage;
          index == 0 ? _newPage = Pages.students : null;
          index == 1 ? _newPage = Pages.content : null;
          index == 2 ? _newPage = Pages.announcements : null;
          setState(() {
            _page = _switchScreen(_newPage);
          });
        },
        letIndexChange: (index) => true,
      ),
      backgroundColor: BACKGROUND,
      body: _page,
    );
  }
}