import 'package:mark_space_app/modules/models/marks/assessment_data.dart';

class UnitData {
  final String name;
  final List<AssessmentData> assessments;

  UnitData({this.name, this.assessments});

  factory UnitData.fromJson(Map<String, dynamic> json) {
    return UnitData(
        name: json['name'],
        assessments: json['assessments']
            .map<AssessmentData>(
                (assessment) => AssessmentData.fromJson(assessment))
            .toList(),
    );
  }
}
