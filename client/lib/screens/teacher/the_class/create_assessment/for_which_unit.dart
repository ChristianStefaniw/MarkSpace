import 'package:flutter/material.dart';
import 'package:mark_space_app/config/routes/routes.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/utils/helpers/bootstrap_container_width.dart';
import 'package:provider/provider.dart';

import 'package:mark_space_app/modules/models/marks/unit_data.dart';
import 'package:mark_space_app/modules/providers/class_data_provider.dart';

class ForWhichUnit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<UnitData> _unitData =
        Provider.of<ClassDataProvider>(context, listen: false).classData.units;
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a Unit"),
        backgroundColor: NAVBAR,
        centerTitle: true,
      ),
      backgroundColor: BACKGROUND,
      body: Center(
        child: Container(
          width: bootstrapContainerWidth(MediaQuery.of(context).size.width),
          child: ListView.builder(
            itemCount: _unitData.length,
            itemBuilder: (_, unit) {
              return Card(
                child: IntrinsicHeight(
                  child: MaterialButton(
                    onPressed: () => Navigator.pushNamed(context, CREATE_ASSESSMENT_FORM, arguments: _unitData[unit].id),
                    child: Container(
                      child: Text(_unitData[unit].name),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
