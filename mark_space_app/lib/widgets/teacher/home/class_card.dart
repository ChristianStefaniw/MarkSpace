import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mark_space_app/config/routes/routes.dart';

import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import './class_card_item.dart';


class ClassCard extends StatelessWidget {
  final ClassData theClass;
  final Color color;
  final int index;

  ClassCard({Key key, this.theClass, this.color, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 60.h),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        elevation: 15,
        child: Container(
          width: 450.w,
          child: InkWell(
            splashColor: Colors.lightBlueAccent,
            onTap: () {
              Navigator.pushNamed(
                context,
                  TEACHERS_CLASS_ROUTE,
                arguments: this.theClass
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
                          this.theClass.icon,
                          height: 120,
                          width: 165,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        this.theClass.name,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: this.color),
                      ),
                    ],
                  ),
                ),
                ClassCardItem(
                  margin:
                      EdgeInsets.symmetric(horizontal: 42.w, vertical: 10.h),
                  title: 'Period:',
                  contents: this.theClass.period,
                  fontSize: 50,
                  fontColor: Colors.black87,
                ),
                ClassCardItem(
                  margin:
                      EdgeInsets.only(top: 10.h, bottom: 10.h, right: 42.w),
                  title: 'Course Code:',
                  contents: this.theClass.code,
                  fontSize: 25,
                  fontColor: this.color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
