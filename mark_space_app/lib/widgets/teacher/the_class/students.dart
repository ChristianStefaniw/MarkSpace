import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/utils/services/class_student_cards/create_student_cards.dart';

class Students extends StatelessWidget {

  final ClassData classData;
  Students(this.classData);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CreateStudentCards(context, classData: this.classData).generateCards(),
      builder: (_, snapshot) {
        if (snapshot.hasData){
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 3.4.h),
            ),
            itemCount: snapshot.data.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return snapshot.data[index];
            },
          );
        } else {
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
