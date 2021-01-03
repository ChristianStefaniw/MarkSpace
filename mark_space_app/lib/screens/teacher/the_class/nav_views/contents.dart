import 'package:flutter/material.dart';
import 'package:mark_space_app/config/routes/arguments/single_content_arguments.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/config/theme/colors.dart';

import 'package:mark_space_app/modules/models/classes/class_data.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/widgets/bootstrap_container.dart';
import 'package:mark_space_app/widgets/custon_dropdown.dart';
import 'package:provider/provider.dart';

class Contents extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ClassData _classData = Provider.of<ClassDataProvider>(context, listen: false).classData;

    return BootstrapContainer(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: _classData.units.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5.0,
              child: new Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: SECONDARY_LIGHT,
                ),
                child: DropdownButtonHideUnderline(
                  child: CustomDropdownButton<String>(
                    hint: Text(_classData.units[index].name),
                    items: _classData.units[index].assessments.map(
                      (assessment) {
                        return DropdownMenuItem<String>(
                          onTap: () {
                            AssessmentData _assessment =
                                AssessmentData.fromJson(assessment);
                            Navigator.pushNamed(context, SINGLE_CONTENT,
                                arguments: SingleContentArguments(
                                    classData: _classData,
                                    assessment: _assessment));
                          },
                          value: assessment['name'],
                          child: new Text(assessment['name']),
                        );
                      },
                    ).toList(),
                    onChanged: (_) {},
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
