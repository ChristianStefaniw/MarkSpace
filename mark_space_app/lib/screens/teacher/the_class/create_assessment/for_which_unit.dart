import 'package:flutter/material.dart';
import 'package:mark_space_app/config/theme/colors.dart';
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
      body: ListView.builder(
        itemCount: _unitData.length,
        shrinkWrap: true,
        //physics: AlwaysScrollableScrollPhysics(),
        //physics: ClampingScrollPhysics(),
        itemBuilder: (_, unit) {
          return Card(
            child: MaterialButton(
              onPressed: () => print(''),
              child: Container(
                child: Text(_unitData[unit].name),
              ),
            ),
          );
        },
      ),
    );
  }
}
