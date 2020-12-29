import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'class_card.dart';

class ClassesGrid extends StatelessWidget {
  final classData;

  ClassesGrid(this.classData);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2.8.h),
      ),
      itemCount: classData.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return ClassCard(
          theClass: classData[index],
          color: CLASS_CARD_TITLE,
        );
      },
    );
  }
}
