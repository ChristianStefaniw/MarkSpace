import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import '../class_card_item.dart';

class ClassCardScreenItems {
  final ClassData theClass;

  ClassCardScreenItems(this.theClass);

  Widget first() {
    final Widget _widget = Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 140.h,
            backgroundImage: NetworkImage(this.theClass.icon)),
        Text(
          this.theClass.name,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 50.h,
              color: CLASS_CARD_TITLE),
        ),
      ],
    );
    return _widget;
  }

  Widget second() {
    final Widget _widget = ClassCardItem(
      title: 'Period:',
      contents: theClass.period,
      fontSize: 60.h,
      fontColor: CLASS_CARD_TITLE,
    );
    return _widget;
  }

  Widget third() {
    final Widget _widget = ClassCardItem(
      title: 'Course Code:',
      contents: this.theClass.code,
      fontSize: 60.h,
      fontColor: CLASS_CARD_TITLE,
    );
    return _widget;
  }
}
