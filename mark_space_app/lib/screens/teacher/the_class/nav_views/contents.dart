import 'package:flutter/material.dart';

import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/config/routes/arguments/single_content_arguments.dart';

class Contents extends StatelessWidget {
  final ClassData classData;

  Contents(this.classData);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: classData.units.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          elevation: 10,
          child: InkWell(
            splashColor: SECONDARY_LIGHT,
            onTap: () => Navigator.pushNamed(
              context,
              SINGLE_CONTENT,
              arguments: SingleContentArguments(
                classData: this.classData,
                unit: classData.units[index],
              ),
            ),
            child: Ink(
              color: PRIMARY,
              padding: EdgeInsets.symmetric(vertical: 20),
              width: double.infinity,
              child: Text(
                classData.units[index].name,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
