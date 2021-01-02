import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mark_space_app/modules/models/teacher/preview_class.dart';
import 'package:mark_space_app/utils/helpers/no_scroll_glow.dart';

import 'class_card.dart';

class ClassesGrid extends StatelessWidget {
  final List<PreviewClass> allPreviewClassData;

  ClassesGrid(this.allPreviewClassData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScrollConfiguration(
        behavior: NoScrollGlow(),
        child: GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 2.8.h),
          ),
          itemCount: allPreviewClassData.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return ClassCard(
              previewClassData: allPreviewClassData[index],
            );
          },
        ),
      ),
    );
  }
}
