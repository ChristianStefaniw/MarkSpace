import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/widgets/inherited.dart';
import 'package:mark_space_app/widgets/class_card.dart';

int num = 0;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 692));

    String user = "Christian";
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: Text("Welcome $user"),
          centerTitle: true,
          backgroundColor: Color(0xff000080),
          leading: Image.asset(
            'assets/images/apple.png',
          ),
        ),
        body: MyInheritedWidget(
          classes: [
            {
              'class': 'Functions',
              'period': 'A',
              'code': 'MCR3U1',
              'icon':
                  'https://ddo0fzhfvians.cloudfront.net/uploads/icons/png/12025030331579680337-512.png',
              'id': '12345',
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
          ],
          child: Builder(builder: (BuildContext innerContext) {
            return Stack(
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
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: width / (height / 0.5.w),
                  ),
                  itemCount: MyInheritedWidget.of(innerContext).classes.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ClassCard(
                      theClass: MyInheritedWidget.of(innerContext).classes[index],
                      color: Color(0xffFF3300),
                    );
                  },
                ),
              ],
            );
          }),
        ));
  }
}
