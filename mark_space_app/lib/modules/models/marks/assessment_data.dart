
import 'package:mark_space_app/modules/models/marks/mark_data.dart';

class AssessmentData{

  final String name;
  final List<MarkData> marks;
  final double weight;

  AssessmentData({this.name, this.marks, this.weight});

  factory AssessmentData.fromJson(Map<String, dynamic> json){
    return AssessmentData(
      name: json['name'],
      weight: json['weight'],
      marks: json['marks'].map<MarkData>((mark) => MarkData.fromJson(mark)).toList(),
    );
  }



}