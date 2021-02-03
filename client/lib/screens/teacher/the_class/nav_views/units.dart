import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mark_space_app/config/routes/arguments/single_assessment_arguments.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';
import 'package:mark_space_app/widgets/custom_dropdown.dart';
import 'package:mark_space_app/modules/models/marks/unit_data.dart';
import 'package:mark_space_app/modules/providers/units_provider.dart';
import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';

class Units extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: bootstrapContainerWidth(MediaQuery.of(context).size.width),
        child: Consumer<UnitsProvider>(builder: (_, model, child) {
          List<UnitData> _unitData =
              Provider.of<ClassDataProvider>(context, listen: false)
                  .classData
                  .units;
          return ListView.builder(
            itemCount: _unitData.length,
            itemBuilder: (_, unit) {
              return Card(
                elevation: 5.0,
                child: new Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: SECONDARY_LIGHT,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: CustomDropdownButton(
                      hint: Text(_unitData[unit].name),
                      items: _unitData[unit].assessments.map(
                        (assessment) {
                          return DropdownMenuItem(
                            value: assessment,
                            child: new Text(assessment.name),
                          );
                        },
                      ).toList(),
                      onChanged: (assessment) {
                        Navigator.pushNamed(
                          context,
                          SINGLE_ASSESSMENT,
                          arguments: SingleAssessmentArguments(
                              assessment: assessment,
                              unit: _unitData[unit]),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
