import 'package:mark_space_app/modules/models/student/student_profile_data.dart';

class AssessmentData{

  final String name;
  final List marks;
  final double weight;

  AssessmentData({this.name, this.marks, this.weight});

  factory AssessmentData.fromJson(Map<String, dynamic> json){
    return AssessmentData(
      name: json['name'],
      weight: json['weight'],
      marks: json['marks'],
    );
  }



}