import 'package:flutter/material.dart';
import 'package:mark_space_app/config/routes/arguments/single_content_arguments.dart';
import 'package:mark_space_app/config/routes/routes.dart';

import 'package:mark_space_app/modules/models/teacher/class_data.dart';

class TheClassContentsContents extends StatelessWidget {
  final ClassData classData;

  TheClassContentsContents(this.classData);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.classData.units.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          elevation: 10,
          child: InkWell(
            splashColor: Colors.white,
            onTap: () => Navigator.pushNamed(
              context,
              SINGLE_CONTENT,
              arguments: SingleContentArguments(
                classData: this.classData,
                unit: this.classData.units[index],
              ),
            ),
            child: Ink(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: Text(
                this.classData.units[index],
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
