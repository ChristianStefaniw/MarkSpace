import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'class_card.dart';

class ClassesGrid extends StatelessWidget {
  final classData;

  ClassesGrid(this.classData);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2.5.h),
      ),
      itemCount: classData.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return ClassCard(
          theClass: classData[index],
          color: Color(0xffFF3300),
        );
      },
    );
  }
}
