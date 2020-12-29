import 'package:flutter/material.dart';
import 'package:mark_space_app/config/theme/colors.dart';

import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/utils/mixins/class_table/create_class_table.dart';


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
                color: BORDER,
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
