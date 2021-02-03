import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'nav_views/announcements.dart';
import 'package:mark_space_app/modules/enums/single_class_pages.dart';
import 'package:mark_space_app/screens/teacher/the_class/nav_views/units.dart';
import 'package:mark_space_app/screens/teacher/the_class/nav_views/students.dart';

class TeachersClass extends StatefulWidget {
  @override
  _TeachersClassState createState() => _TeachersClassState();
}

class _TeachersClassState extends State<TeachersClass> {
  final GlobalKey _bottomNavigationKey = GlobalKey();
  Widget _page;
  final Map<String, Widget> _pageWidgets = {
    'Students': Students(),
    'Units': Units(),
    'Announcements': Announcements()
  };

  void initState() {
    _page = _switchScreen(Pages.students);
    super.initState();
  }

  Widget _switchScreen(Pages page) {
    switch (page) {
      case Pages.students:
        return _pageWidgets['Students'];
        break;
      case Pages.content:
        return _pageWidgets['Units'];
        break;
      case Pages.announcements:
        return _pageWidgets['Announcements'];
        break;
      default:
        return _pageWidgets['Students'];
    }
  }

  @override
  Widget build(BuildContext context) {
    ClassData _classData =
        Provider.of<ClassDataProvider>(context, listen: false).classData;

    return Scaffold(
      appBar: AppBar(
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
            _page = _switchScreen(_newPage);
          });
        },
        letIndexChange: (index) => true,
      ),
      floatingActionButton: SpeedDial(
        overlayOpacity: 0,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            backgroundColor: SPEED_DIAL_COLORS[1],
            label: "Add Student",
            child: Icon(Icons.person_add),
            onTap: () => Navigator.pushNamed(
              context,
              ADD_STUDENT,
            ),
          ),
          SpeedDialChild(
            backgroundColor: SPEED_DIAL_COLORS[0],
            child: Icon(Icons.add),
            label: "Create Unit",
            onTap: () => Navigator.pushNamed(context, CREATE_UNIT),
          ),
          SpeedDialChild(
            backgroundColor: SPEED_DIAL_COLORS[2],
            label: "Create Assessment",
            child: Icon(Icons.assessment),
            onTap: () => Navigator.pushNamed(
              context,
              CREATE_ASSESSMENT,
            ),
          ),
          SpeedDialChild(
            backgroundColor: SPEED_DIAL_COLORS[3],
            label: "Create Announcement",
            child: Icon(Icons.announcement),
            onTap: () => Navigator.pushNamed(
              context,
              CREATE_ANNOUNCEMENT_FORM,
            ),
          )
        ],
      ),
      backgroundColor: BACKGROUND,
      body: _page,
    );
  }
}
