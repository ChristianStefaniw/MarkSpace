import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/config/theme/colors.dart';

import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/utils/ui/animations/scale_transition.dart' as MyScaleTransition;
import './class_card_item.dart';


class ClassCard extends StatefulWidget {
  final ClassData theClass;
  final Color color;

  ClassCard({Key key, @required this.theClass, @required this.color}) : super(key: key);

  @override
  _ClassCardState createState() => _ClassCardState();
}

class _ClassCardState extends State<ClassCard> with TickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _animation = MyScaleTransition.ScaleTransition(_controller).animation;
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Center(
        child: Card(
          color: PRIMARY,
          margin: EdgeInsets.symmetric(vertical: 60.h),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          elevation: 10,
          child: Container(
            width: 450.w,
            child: InkWell(
              splashColor: CLASS_CARD_SPLASH,
              onTap: () {
                Navigator.pushNamed(
                  context,
                    TEACHERS_CLASS_ROUTE,
                  arguments: this.widget.theClass
                );
              },
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 42.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            this.widget.theClass.icon,
                            height: 120,
                            width: 165,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          this.widget.theClass.name,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: this.widget.color),
                        ),
                      ],
                    ),
                  ),
                  ClassCardItem(
                    margin:
                        EdgeInsets.symmetric(horizontal: 42.w, vertical: 10.h),
                    title: 'Period:',
                    contents: this.widget.theClass.period,
                    fontSize: 50,
                    fontColor: FONT_COLOR_PRIMARY,
                  ),
                  ClassCardItem(
                    margin:
                        EdgeInsets.only(top: 10.h, bottom: 10.h, right: 42.w),
                    title: 'Course Code:',
                    contents: this.widget.theClass.code,
                    fontSize: 25,
                    fontColor: this.widget.color,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
