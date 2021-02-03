import 'package:mark_space_app/modules/models/marks/assessment_data.dart';

class UnitData {
  final String name;
  final String id;
  final List<AssessmentData> assessments;

  UnitData({this.name, this.assessments, this.id});

  factory UnitData.fromJson(Map<String, dynamic> json) {
    return UnitData(
        name: json['name'],
        assessments: json['assessments']
            .map<AssessmentData>(
                (assessment) => AssessmentData.fromJson(assessment))
            .toList(),
        id: json['id'],
    );
  }
}
