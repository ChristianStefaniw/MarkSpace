import 'package:mark_space_app/modules/models/marks/sub_grades.dart';

class MarkData{
  final List<SubGrade> subGrades;
  final double grade;
  final String studentName;

  MarkData({this.subGrades, this.grade, this.studentName});

  factory MarkData.fromJson(Map<String, dynamic> json){
    return MarkData(
      subGrades: json['subs'].map<SubGrade>((sub) => SubGrade.fromJson(sub)).toList(),
      grade: double.parse(json['grade']),
      studentName: json['student']['name'],
    );
  }

}