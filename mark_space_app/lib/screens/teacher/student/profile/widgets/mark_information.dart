import 'package:flutter/material.dart';
import 'package:mark_space_app/config/theme/colors.dart';
import 'package:mark_space_app/modules/models/marks/assessment_data.dart';
import 'package:mark_space_app/modules/models/marks/mark_data.dart';
import 'package:mark_space_app/screens/teacher/the_class/widgets/single_content_card.dart';
import 'package:mark_space_app/widgets/bootstrap_container.dart';

class MarkInformation extends StatelessWidget {

  final AssessmentData assessmentData;
  final String unitName;

  MarkInformation(this.assessmentData, this.unitName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: NAVBAR,
        title: Text("${this.unitName} - ${this.assessmentData.name}"),
      ),
      body: BootstrapContainer(
        children: this.assessmentData.marks.map((mark) {
          return SingleContentCard(mark);
        }).toList(),
      )
    );
  }
}
