import 'package:flutter/material.dart';

import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/teacher/class_data.dart';
import 'package:mark_space_app/utils/services/class_table/create_class_table.dart';

class TheClass extends StatelessWidget {
  final ClassData classData;

  TheClass(this.classData);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: CreateClassTable(this.classData).createTable(context),
          builder: (_, snapshot) {
            return snapshot.hasData
                ? Table(
                    border: TableBorder.all(
                        color: BORDER, width: 1, style: BorderStyle.none),
                    children: snapshot.data,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
