import 'package:flutter/material.dart';
import 'package:mark_space_app/config/routes/arguments/single_content_arguments.dart';
import 'package:mark_space_app/config/routes/routes.dart';

import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';

class Contents extends StatelessWidget {
  final ClassData classData;

  Contents(this.classData);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.classData.units.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          elevation: 10,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(this.classData.units[index].name),
              items: this.classData.units[index].assessments.map((value) {
                return new DropdownMenuItem<String>(
                  onTap: () {
                    AssessmentData _assessment = AssessmentData.fromJson(value);
                    Navigator.pushNamed(context, SINGLE_CONTENT,
                        arguments: SingleContentArguments(
                            classData: this.classData, assessment: _assessment));
                  },
                  value: value['name'],
                  child: new Text(value['name']),
                );
              }).toList(),
              onChanged: (_) {},
            ),
          ),
        );
      },
    );
  }
}
