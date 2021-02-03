import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassCardItem extends StatelessWidget {
  final EdgeInsets margin;
  final String title;
  final String contents;
  final double fontSize;
  final Color fontColor;
  final Color color;

  ClassCardItem(
      {Key key,
      this.color,
      this.margin,
      this.title,
      this.contents,
      this.fontSize,
      this.fontColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      color: this.color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25.h),
            ),
            Text(
              this.contents,
              style: GoogleFonts.montserrat(
                color: this.fontColor,
                fontSize: this.fontSize,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
