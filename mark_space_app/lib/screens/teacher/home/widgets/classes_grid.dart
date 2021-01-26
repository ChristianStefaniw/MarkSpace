import 'package:flutter/material.dart';

import 'package:mark_space_app/utils/helpers/no_scroll_glow.dart';
import 'class_card/class_card.dart';

class ClassesGrid extends StatelessWidget {
  final List<dynamic> allPreviewClassData;

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
            childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height/1.2),
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
