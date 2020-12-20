import 'package:flutter/material.dart';

import 'package:mark_space_app/models/teacher/class_data.dart';
import 'package:mark_space_app/other/util/create_class_table.dart';

class TheClassContent extends StatelessWidget {
  final ClassData classData;

  TheClassContent(this.classData);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CreateClassTable(this.classData).createTable(context),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Table(
            border: TableBorder.all(
                color: Colors.black26,
                width: 1,
                style: BorderStyle.none),
            children: snapshot.data,
          )
              : Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
