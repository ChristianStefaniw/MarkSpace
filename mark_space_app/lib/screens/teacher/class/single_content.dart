import 'package:flutter/material.dart';

import 'package:mark_space_app/models/teacher/class_data.dart';
import 'package:mark_space_app/widgets/teacher/class/single_content_grades.dart';

class SingleContent extends StatelessWidget {
  final ClassData classData;
  final String unit;

  SingleContent({this.classData, this.unit});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff000080),
        title: Text("${this.unit}"),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[400],
          ),
          SingleContentGrades(classData: this.classData, unit: this.unit,)
        ],
      ),
    );
  }
}
