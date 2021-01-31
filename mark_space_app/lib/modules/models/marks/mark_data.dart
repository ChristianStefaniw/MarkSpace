import 'package:mark_space_app/modules/models/marks/sub_grades.dart';
import 'package:mark_space_app/modules/models/student/student_profile_data.dart';

class MarkData{
  final List<SubGrade> subGrades;
  final double grade;
  final StudentProfileData student;

  MarkData({this.subGrades, this.grade, this.student});

  factory MarkData.fromJson(Map<String, dynamic> json){
    return MarkData(
      subGrades: json['subs'].map<SubGrade>((sub) => SubGrade.fromJson(sub)).toList(),
      grade: double.parse(json['grade']),
      student: StudentProfileData.fromJson(json['student']),
    );
  }

}