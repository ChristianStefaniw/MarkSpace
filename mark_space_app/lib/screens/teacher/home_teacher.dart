import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/models/teacher/class_data.dart';
import 'package:mark_space_app/widgets/teacher/home/classes_grid.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(1080, 1920));

    String user = "Christian";

    List classes = [
      {
        'class': 'Functions',
        'period': 'A',
        'code': 'MCR3U1',
        'icon':
        'https://ddo0fzhfvians.cloudfront.net/uploads/icons/png/12025030331579680337-512.png',
        'id': '1234',
      },
      {
        'class': 'Biology',
        'period': 'B',
        'code': 'SBI3U',
        'icon': 'https://image.flaticon.com/icons/png/512/201/201555.png',
        'id': '12345',
      },
      {
        'class': 'Chemistry',
        'period': 'C',
        'code': 'SCH3UI',
        'icon':
        'https://images.vexels.com/media/users/3/153061/isolated/preview/c30ab5faafa7fdbbaadff8e2ee9df294-chemistry-flask-icon-by-vexels.png',
        'id': '12345',
      },
      {
        'class': 'Chemistry',
        'period': 'C',
        'code': 'SCH3UI',
        'icon':
        'https://images.vexels.com/media/users/3/153061/isolated/preview/c30ab5faafa7fdbbaadff8e2ee9df294-chemistry-flask-icon-by-vexels.png',
        'id': '12345',
      },
      {
        'class': 'Chemistry',
        'period': 'C',
        'code': 'SCH3UI',
        'icon':
        'https://images.vexels.com/media/users/3/153061/isolated/preview/c30ab5faafa7fdbbaadff8e2ee9df294-chemistry-flask-icon-by-vexels.png',
        'id': '12345',
      },
      {
        'class': 'Chemistry',
        'period': 'C',
        'code': 'SCH3UI',
        'icon':
        'https://images.vexels.com/media/users/3/153061/isolated/preview/c30ab5faafa7fdbbaadff8e2ee9df294-chemistry-flask-icon-by-vexels.png',
        'id': '12345',
      },
    ];

    List<ClassData> classData = [];

    classes.forEach((element) {
      classData.add(ClassData(
        id: element['id'],
        code: element['code'],
        name: element['class'],
        period: element['period'],
        icon: element['icon'],
      ));
    });

    return Scaffold(
        appBar: AppBar(
            title: Text("Welcome $user"),
            centerTitle: true,
            backgroundColor: Color(0xff000080),
            leading: Image.asset(
              'assets/images/apple.png',
            ),
            actions: [
              IconButton(
                tooltip: "Add class",
                icon: Icon(Icons.add),
                color: Colors.white,
                onPressed: () => print("add class"),
              )
            ]
        ),
        body: Stack(
          children: [
            Container(
              color: Color(0xffE8E8E8),
            ),
            Transform(
              alignment: FractionalOffset.topRight,
              transform: Matrix4.rotationZ(0.1),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(1000),
                  ),
                ),
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
              ),
            ),
            ClassesGrid(classData),
          ],
        )
    );
  }
}
