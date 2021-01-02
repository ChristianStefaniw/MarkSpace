import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:mark_space_app/screens/teacher/the_class/nav_views/announcements.dart';
import 'package:mark_space_app/screens/teacher/the_class/nav_views/contents.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'nav_views/students.dart';

class TeachersClass extends StatefulWidget {
  final ClassData data;

  TeachersClass(this.data);

  @override
  _TeachersClassState createState() => _TeachersClassState();
}

class _TeachersClassState extends State<TeachersClass> {
  final GlobalKey _bottomNavigationKey = GlobalKey();
  Widget _page;

  Widget _whichScreen(int index) {
    switch (index) {
      case 0:
        return TheClass(this.widget.data);
        break;
      case 1:
        return Contents(this.widget.data);
        break;
      case 2:
        return Announcements();
      default:
        return TheClass(this.widget.data);
    }
  }

  @override
  void initState() {
    _page = _whichScreen(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: EdgeInsets.only(right: 7.w),
            child: IconButton(
              tooltip: "Add student",
              icon: Icon(Icons.person_add),
              onPressed: () => print('add student'),
            ),
          ),
          IconButton(
            tooltip: "Add unit",
            icon: Icon(Icons.add),
            onPressed: () => print('add unit'),
          ),
        ],
        title: Text("${widget.data.name} - ${widget.data.period}"),
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
          setState(() {
            _page = _whichScreen(index);
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: BACKGROUND,
        width: double.infinity,
        height: double.infinity,
        child: _page,
      ),
    );
  }
}
